# frozen_string_literal: true

RSpec.describe ExchangeRatesParseService, :vcr do
  it 'return correct array' do
    result = ExchangeRatesParseService.new.call
    expect(result.class).to eq(Array)
    expect(result[0]).to eq(
      'category' => 'DepositPayments',
      'buy' => 66.35,
      'fromCurrency' => { 'code' => 840, 'name' => 'USD', 'strCode' => '840' },
      'sell' => 71.9,
      'toCurrency' => { 'code' => 643, 'name' => 'RUB', 'strCode' => '643' }
    )
  end
end
