require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { User.create!(
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    birthday: '1990-01-01',
    gender: 'female',
    address: '123 Main St',
    cp_number: '555-555-5555'
  )}

  let!(:transaction1) { Transaction.create!(
    user: user,
    stock: Stock.create!(name: 'Sample Stock', ticker: 'SSTK', price: 100),
    amount: 100,
    balance: 1000,
    transaction_type: 'buy'
  )}

  let!(:transaction2) { Transaction.create!(
    user: user,
    stock: Stock.create!(name: 'Another Stock', ticker: 'ASTK', price: 200),
    amount: 200,
    balance: 800,
    transaction_type: 'sell'
  )}

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all transactions to @transactions' do
      get :index
      expect(assigns(:transactions)).to match_array([transaction1, transaction2])
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
