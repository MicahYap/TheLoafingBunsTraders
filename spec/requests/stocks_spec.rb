require 'rails_helper'

RSpec.describe "/stocks", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get stocks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get stock_url(stock)
      expect(response).to be_successful
    end
  end

end
