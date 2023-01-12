class ExchangeRatesController < ApplicationController
  def index
    @chart_data = ExchangeRate.all
  end

  def parse
    ExchangeRatesWorker.new.perform
  end
end
