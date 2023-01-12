# frozen_string_literal: true

RSpec.describe ExchangeRatesWorker do
  describe '#perform' do
    before do
      allow_any_instance_of(ExchangeRatesParseService).to receive(:call).and_return(
        [
          { 'category' => 'DepositPayments',
            'fromCurrency' => { 'code' => 840, 'name' => 'USD', 'strCode' => '840' },
            'toCurrency' => { 'code' => 643, 'name' => 'RUB', 'strCode' => '643' },
            'buy' => 76.7, 'sell' => 80.65 }
        ]
      )
    end

    it 'correct work Sidekiq Workers' do
      described_class.new.perform
      expect(ExchangeRate.first).to have_attributes(
        from_name: 'USD',
        from_code: 840,
        to_name: 'RUB',
        to_code: 643,
        buy: '76.7'.to_d,
        sell: '80.65'.to_d
      )
    end
  end
end
