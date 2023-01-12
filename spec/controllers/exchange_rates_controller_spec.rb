require 'rails_helper'

RSpec.describe ExchangeRatesController, type: :controller do

  before :index

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #parse" do
    it "success upsert exchange rates" do

    end
  end
end
