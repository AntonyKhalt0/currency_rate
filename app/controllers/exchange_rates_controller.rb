# frozen_string_literal: true

class ExchangeRatesController < ApplicationController
  def index; end

  def parse
    ExchangeRatesWorker.new.perform
  end
end
