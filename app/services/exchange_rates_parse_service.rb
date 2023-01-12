# frozen_string_literal: true

require 'open-uri'

class ExchangeRatesParseService
  EXCHANGE_RATES_URL = 'https://www.tinkoff.ru/api/v1/currency_rates'

  def call
    exchange_rates.select do |rate|
      rate['category'] == 'DepositPayments'
    end
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
end
