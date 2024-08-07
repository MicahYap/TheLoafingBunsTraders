require 'rails_helper'

RSpec.describe "stocks/index", type: :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        name: "Name",
        ticker: "Ticker",
        price: "9.99"
      ),
      Stock.create!(
        name: "Name",
        ticker: "Ticker",
        price: "9.99"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ticker".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
