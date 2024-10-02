require 'rails_helper'

RSpec.describe "/trader_stocks", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get trader_stocks_url
      expect(response).to be_successful
    end
  end


  describe "DELETE /destroy" do
    it "destroys the trader_stock" do
      expect {
        delete trader_stock_url(trader_stock)
      }.to change(TraderStock, :count).by(-1)
    end
  end
end
