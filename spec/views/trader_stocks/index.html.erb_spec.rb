require 'rails_helper'

RSpec.describe "trader_stocks/index", type: :view do
  before(:each) do
    assign(:trader_stocks, [
      TraderStock.create!(),
      TraderStock.create!()
    ])
  end

  it "renders a list of trader_stocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
