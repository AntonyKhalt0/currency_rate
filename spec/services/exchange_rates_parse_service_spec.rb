# frozen_string_literal: true

RSpec.describe ExchangeRatesParseService, :vcr do
  it 'return correct result' do
    result = ExchangeRatesParseService.new.call
    expect(result.class).to eq(ActiveRecord::Result)
  end
end
