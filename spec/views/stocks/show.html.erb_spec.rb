require 'rails_helper'

RSpec.describe "stocks/show", type: :view do
  before(:each) do
    assign(:stock, Stock.create!(
      name: "Name",
      ticker: "Ticker",
      price: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Ticker/)
    expect(rendered).to match(/9.99/)
  end
end
