require 'rails_helper'

RSpec.describe "trader_stocks/edit", type: :view do
  let(:trader_stock) {
    TraderStock.create!()
  }

  before(:each) do
    assign(:trader_stock, trader_stock)
  end

  it "renders the edit trader_stock form" do
    render

    assert_select "form[action=?][method=?]", trader_stock_path(trader_stock), "post" do
    end
  end
end
