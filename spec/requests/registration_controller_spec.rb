require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          user: {
            email: 'test@example.com',
            password: 'password123',
            password_confirmation: 'password123',
            birthday: '2000-01-01',
            gender: 'Male',
            address: '123 Test St',
            cp_number: '1234567890'
          }
        }
      end

      it 'creates a new trader with pending status' do
        expect {
          post :create, params: valid_attributes
        }.to change(User, :count).by(1)

        user = User.last
        expect(user.email).to eq('test@example.com')
        expect(user.user_type).to eq('trader')
        expect(user.status).to eq('pending')
      end

      it 'sends pending approval email to the trader and admins' do
        admin = User.create!(email: 'admin@example.com', password: 'admin123', user_type: 'admin')
        
        expect {
          post :create, params: valid_attributes
        }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end

      it 'redirects to the root path with a notice' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Thanks for creating an account with us! Your account is pending review and approval.')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          user: {
            email: '',
            password: 'password123',
            password_confirmation: 'password123',
            birthday: '2000-01-01',
            gender: 'Male',
            address: '123 Test St',
            cp_number: '1234567890'
          }
        }
      end

      it 'does not create a new user' do
        expect {
          post :create, params: invalid_attributes
        }.to_not change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
end
