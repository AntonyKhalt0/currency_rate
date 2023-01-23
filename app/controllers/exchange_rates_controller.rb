# frozen_string_literal: true

class ExchangeRatesController < ApplicationController
  def index; end

  def parse
    ExchangeRatesParseService.new.call
  end
end
