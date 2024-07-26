class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_type, inclusion: {in: ['admin', 'trader']}, presence: true

  before_validation :set_default_user_type

  private

  def set_default_user_type
    self.user_type ||= 'trader'
  end

end
