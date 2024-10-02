class TraderStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validate :user_should_be_trader
end

private
def user_should_be_trader
  user.user_type == 'trader'
end
