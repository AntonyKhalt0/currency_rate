# frozen_string_literal: true

require 'open-uri'

class ExchangeRatesParseService
  EXCHANGE_RATES_URL = 'https://www.tinkoff.ru/api/v1/currency_rates'

  def call
    ExchangeRate.upsert_all(parse_data)
  end

  private

  def crude_data
    URI.parse(EXCHANGE_RATES_URL).read
  end

  def json_data
    JSON.parse(crude_data)
  end

  def exchange_rates
    json_data.dig('payload', 'rates').to_a
  end

  def select_deposit_payments
    exchange_rates.select do |rate|
      rate['category'] == 'DepositPayments'
    end
  end

  def parse_data
    select_deposit_payments.map do |rate|
      {
        from_name: rate.dig('fromCurrency', 'name'),
        from_code: rate.dig('fromCurrency', 'code'),
        to_name: rate.dig('toCurrency', 'name'),
        to_code: rate.dig('toCurrency', 'code'),
        buy: rate['buy'],
        sell: rate['sell'],
        created_at: current_time,
        updated_at: current_time
      }
    end
  end

  def current_time
    Time.current
  end
end
