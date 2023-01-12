# frozen_string_literal: true

RSpec.describe ExchangeRatesParseService, :vcr do
  it 'return correct array' do
    result = ExchangeRatesParseService.new.call
    expect(result.class).to eq(Array)
    expect(result[0]).to include(
      'category' => 'DepositPayments'
    )
  end
end
