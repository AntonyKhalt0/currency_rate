# frozen_string_literal: true

module Api
  module V1
    class ExchangeRatesController < Api::V1::BaseController
      def index
        render json: json_data
      end

      private

      def exchange_rates
        ExchangeRate.where("from_name IN (?) OR to_name IN (?)", params['names'], params['names'])
                    .where(created_at: first_date..last_date)
      end

      def json_data
        params['names'].map do |name|
          {
            name => currencies_of(name)
          }
        end
      end

      def currencies_of(name)
        exchange_rates.select{ |er| er.from_name == name || er.to_name == name }.map do |rate|
          {
            from: rate.from_name,
            to: rate.to_name,
            buy: rate.buy,
            sell: rate.sell,
            date: rate.created_at
          }
        end
      end

      def first_date
        params['first_date'].to_date.beginning_of_day
      end

      def last_date
        params['last_date'].to_date.end_of_day
      end
    end
  end
end
