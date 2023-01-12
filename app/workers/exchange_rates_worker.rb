class ExchangeRatesWorker
  include Sidekiq::Worker

  def perform
    current_time = Time.current
    parse_data = ExchangeRatesParserService.new.call.map do |rate|
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

    ExchangeRate.upsert_all(parse_data)
  end
end
