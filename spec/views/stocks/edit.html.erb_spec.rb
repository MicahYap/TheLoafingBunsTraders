require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  let(:stock) {
    Stock.create!(
      name: "MyString",
      ticker: "MyString",
      price: "9.99"
    )
  }

  before(:each) do
    assign(:stock, stock)
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(stock), "post" do

      assert_select "input[name=?]", "stock[name]"

      assert_select "input[name=?]", "stock[ticker]"

      assert_select "input[name=?]", "stock[price]"
    end
  end
end
