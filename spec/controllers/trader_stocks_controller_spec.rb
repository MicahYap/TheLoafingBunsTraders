require 'rails_helper'

RSpec.describe TraderStocksController, type: :controller do
  let(:user) { User.create!(
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    birthday: '2000-06-20',
    gender: 'female',
    address: '1234 PP Lane',
    cp_number: '83838383',
    money: 5000
  )}
  
  let(:stock) { Stock.create!(
    name: 'Sample Stock',
    ticker: 'SSTK',
    price: 100
  )}
  
  let(:trader_stock) { TraderStock.create!(
    user: user,
    stock: stock
  )}

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns the trader stocks to @trader_stocks' do
      get :index
      expect(assigns(:trader_stocks)).to include(trader_stock)
    end
  end

  describe 'POST #buy' do
    context 'when user has enough money' do
      it 'buys a stock and creates a transaction' do
        expect {
          post :buy, params: { id: stock.id }
        }.to change(Transaction, :count).by(1)
        expect(user.stocks).to include(stock)
        expect(user.money).to eq(4900)
        expect(flash[:notice]).to be_nil
      end
    end

    context 'when user does not have enough money' do
      before do
        user.update(money: 50)  # set money to less than stock price
      end

      it 'does not buy the stock and shows an error' do
        post :buy, params: { id: stock.id }
        expect(user.stocks).not_to include(stock)
        expect(user.money).to eq(50)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the trader stock and creates a sell transaction' do
      expect {
        delete :destroy, params: { id: trader_stock.id }
      }.to change(TraderStock, :count).by(-1)
        .and change(Transaction, :count).by(1)
      expect(user.money).to eq(5100)
    end
  end
end
