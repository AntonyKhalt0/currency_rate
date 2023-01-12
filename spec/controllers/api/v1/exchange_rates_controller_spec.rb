# frozen_string_literal: true

RSpec.describe Api::V1::ExchangeRatesController, type: :controller do
  describe '#index' do
    let(:current_time) { Time.current }

    subject(:http_request) do
      get :index, params: { names: ['EUR'],
                            first_date: current_time - 2.hour,
                            last_date: current_time }
    end

    context 'when EUR' do
      before do
        create :exchange_rate, { from_name: 'EUR',
                                 from_code: 840,
                                 to_name: 'RUB',
                                 to_code: 643,
                                 buy: 71.85,
                                 sell: 77.45,
                                 created_at: current_time - 1.hour,
                                 updated_at: current_time - 1.hour }
      end

      it 'status 200' do
        http_request

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq([{"EUR"=>
                                                    [{"buy"=>"71.85",
                                                     "date"=>(current_time - 1.hour).as_json,
                                                     "from"=>"EUR",
                                                     "sell"=>"77.45",
                                                     "to"=>"RUB"}]}])
      end
    end
  end
end
