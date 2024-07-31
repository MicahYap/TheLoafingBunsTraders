require 'rails_helper'

RSpec.describe AdminDashboardController, type: :controller do

  let!(:admin) {User.find_by(email: 'admin1@email.com')}

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns success' do
      get :index
      expect(response).to be_successful
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

  describe 'DELETE #deny' do
    it 'denies a trader and redirect to index' do
    expect{
      delete :deny, params: {id: trader.id}
    }.to change (User, :count).by(-1)
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
    it "should create new trader and redirect to index"
      expect {
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
      expect(response).to redirect_to (admin_dashboard_index_path)
    end

    it "should not save with missing details and stay at #create page"
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

  describe 'Delete #destroy'
    it 'should delete trader and stay go to index page' do
      expect{
        delete :destroy, params: { id: trader.id }
      }.to change (User, :count).to(-1)
      expect(response).to redirect_to (admin_dashboard_index_path)
    end
  end

  describe 'GET #edit' do
    it 'should show edit page' do
      get :edit
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    it 'should update trader and redirect to index page' do
      patch :update, params: {
        id: trader.id,
        user: {
          email: 'trader1@email.com', 
          password: 'password',
          password_confirmation: 'password', 
          birthday: '2000-06-20', 
          gender: 'female', 
          address: '222 PP Lane', 
          cp_number: '83838383', 
          user_type: 'trader', 
        }
      }
      trader.reload
      expect(trader.address).to eq('222 PP Lane')
      expect(response).to redirect_to(admin_dashboard_index_path)
    end
  end

end