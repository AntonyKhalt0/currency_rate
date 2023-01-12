# frozen_string_literal: true

require 'rails_helper'

describe 'Exchange rates API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end
  let(:exchange_rate) { create(:exchange_rate) }

  before { get '/api/v1/exchange_rates/index', headers: headers }

  describe 'GET #index' do
    it_behaves_like 'API success response'
    it_behaves_like 'API fields' do
      let(:resource_response) { json }
      let(:resource) { exchange_rate }
    end
  end
end
