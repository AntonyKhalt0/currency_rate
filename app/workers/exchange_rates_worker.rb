# frozen_string_literal: true

class ExchangeRatesWorker
  include Sidekiq::Worker

  def perform
    ExchangeRatesParseService.new.call
  end
end
