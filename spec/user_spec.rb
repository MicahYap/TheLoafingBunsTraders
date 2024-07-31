require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'does not save without email' do
      debugger
      user = User.new(
        password: 'password',
        password_confirmation: 'password',
        birthday: '2000-06-20',
        gender: 'female',
        address: '1234 PP Lane',
        cp_number: '83838383'
      )
      expect(user.save).to be_falsey
    end

    it 'does not save without password' do
      user = User.new(
        email: 'trader1@email.com',
        password_confirmation: 'password',
        birthday: '2000-06-20',
        gender: 'female',
        address: '1234 PP Lane',
        cp_number: '83838383'
      )
      expect(user.save).to be_falsey
    end

    it 'does not save without password confirmation' do
      user = User.new(
        email: 'trader1@email.com',
        password: 'password',
        birthday: '2000-06-20',
        gender: 'female',
        address: '1234 PP Lane',
        cp_number: '83838383'
      )
      expect(user.save).to be_falsey
    end
  end
end
