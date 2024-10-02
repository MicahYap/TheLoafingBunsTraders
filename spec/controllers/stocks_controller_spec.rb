require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let!(:stock) { Stock.create!(
    name: 'Sample Stock',
    ticker: 'SSTK',
    price: 100
  )}

  describe 'GET #index' do
    it 'assigns all stocks to @stocks' do
      get :index
      expect(assigns(:stocks)).to eq([stock])
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested stock to @stock' do
      get :show, params: { id: stock.id }
      expect(assigns(:stock)).to eq(stock)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: stock.id }
      expect(response).to render_template(:show)
    end
  end
end
