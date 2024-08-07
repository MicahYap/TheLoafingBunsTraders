require 'rails_helper'

RSpec.describe "trader_stocks/show", type: :view do
  before(:each) do
    assign(:trader_stock, TraderStock.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
