require 'rails_helper'

RSpec.describe AdminDashboardController, type: :controller do
  let!(:admin) {User.create!(
    email: 'admin1@email.com', 
    password: 'password',
    password_confirmation: 'password', 
    birthday: '2000-06-20', 
    gender: 'female', 
    address: '1234 PP Lane', 
    cp_number: '83838383'
  )}
  let!(:trader) {User.create!(
    email: 'trader1@email.com', 
    password: 'password',
    password_confirmation: 'password', 
    birthday: '2000-06-20', 
    gender: 'female', 
    address: '1234 PP Lane', 
    cp_number: '83838383'
  )}
  let!(:stock){Stock.create!(
    name: 'sample stock',
    ticker: 'ticker',
    price: 999
  )}

  let(:transaction){Transaction.create!(
    user: trader,
    stock: stock,
    amount: 100,
    balance: 4900,
    transaction_type: 'buy'
  )}

  before do
    admin.update(user_type: 'admin')
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns success' do
      get :index
      expect(response.code).to eq('200')
    end
  end

  describe 'PATCH #approve' do
    it 'approves trader and redirect to index' do
      patch :approve, params: {id: trader.id}
      trader.reload
      expect(trader.status).to eq('approved')
      expect(response).to redirect_to(admin_dashboard_index_path)
    end
  end

  describe 'GET #transactions' do
    it 'gets transaction of a trader' do
      get :transactions, params: {id: trader.id}

      expect(assigns(:trader)).to eq(trader)
      expect(assigns(:transactions)).to match_array([transaction])
    end
  end

  describe 'show #show' do
    it 'shows pending traders' do
      pending_trader = User.create!(
        email: 'approved_trader@email.com',
        password: '111111',
        password_confirmation: '111111',
        birthday: '2000-06-20', 
        gender: 'female', 
        address: '1234 PP Lane', 
        cp_number: '83838383'
      )
      get :show
      expect(assign(:pending_traders)).to include(pending_trader)
    end
  end

  describe 'DELETE #deny' do
    it 'denies a trader and redirect to index' do
    expect{
      delete :deny, params: {id: trader.id}
    }.to change(User, :count).by(-1)
    expect(response).to redirect_to(admin_dashboard_index_path)
    end
  end

  describe 'GET #new' do
    it 'returns success' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it "should create new trader and redirect to index" do
      expect{
        post :create, params: {
          user: 
          {
            email: 'trader1@email.com', 
            password: 'password',
            password_confirmation: 'password', 
            birthday: '2000-06-20', 
            gender: 'female', 
            address: '1234 PP Lane', 
            cp_number: '83838383'
          }
        }
      }.to change(User, :count).by(1)
    end

    it "should not save with missing details and stay at #create page" do
      expect{
        post :create, params: {
          user: {
            email: 'trader1@email.com', 
            password: '',
            password_confirmation: '', 
            birthday: '2000-06-20', 
            gender: 'female', 
            address: '1234 PP Lane', 
            cp_number: '83838383'
          }
        }
      }.not_to change(User, :count)
      expect(response).to render_template(:new)
    end
  end

  describe 'Delete #destroy' do
    it 'should delete trader and stay go to index page' do
      expect{
        delete :destroy, params: { id: trader.id }
      }.to change(User, :count).to(-1)
      expect(response).to redirect_to(admin_dashboard_index_path)
    end
  end

  describe 'PATCH #update' do
  it 'updates the trader and redirects to the index page' do
    patch :update, params: {
      id: trader.id,
      user: {
        email: 'trader1@email.com', 
        password: 'password',
        password_confirmation: 'password', 
        birthday: '2000-06-20', 
        address: '222 PP Lane', 
        cp_number: '83838383', 
        gender: 'female'
      }
    }
    trader.reload
    expect(trader.address).to eq('222 PP Lane')
    expect(response).to redirect_to(admin_dashboard_index_path)
    expect(flash[:notice]).to eq('Updated successfully!')
  end
end


end