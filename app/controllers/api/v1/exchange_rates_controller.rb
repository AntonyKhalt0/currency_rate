# frozen_string_literal: true

module Api
  module V1
    class ExchangeRatesController < Api::V1::BaseController
      def index
        render json: json_data
      end

      private

      def exchange_rates
        ExchangeRate.where(from_name: params['from_name'])
                    .where(created_at: first_date..last_date)
      end

      def json_data
        er = {}
        params['from_name'].each do |name|
          er.store(name, to_currency(name))
        end
        er
      end

      def to_currency(name)
        to_currency = []
        exchange_rates.where(from_name: name).each do |rate|
          to_currency << {
            to: rate['to_name'],
            buy: rate['buy'],
            sell: rate['sell']
          }
        end
        to_currency
      end

      def first_date
        params['first_date'].to_date - 1.day
      end

      def last_date
        params['last_date'].to_date + 1.day
      end
    end
  end
end
