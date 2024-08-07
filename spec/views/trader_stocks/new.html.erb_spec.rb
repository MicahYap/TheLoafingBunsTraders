require 'rails_helper'

RSpec.describe "trader_stocks/new", type: :view do
  before(:each) do
    assign(:trader_stock, TraderStock.new())
  end

  it "renders new trader_stock form" do
    render

    assert_select "form[action=?][method=?]", trader_stocks_path, "post" do
    end
  end
end
