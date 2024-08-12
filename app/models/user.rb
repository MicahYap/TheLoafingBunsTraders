class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :user_type, inclusion: {in: ['admin', 'trader']}, presence: true
  validates :status, inclusion: {in: ['pending', 'approved']}, presence: true

  before_validation :set_default_user_type
  before_create :set_default_status

  has_many :trader_stocks
  has_many :stocks, through: :trader_stocks
  scope :traders, -> { where(user_type: 'trader') }

  has_many :transactions

  private

  def set_default_user_type
    self.user_type ||= 'trader'
  end

  def set_default_status
    self.status ||='pending'
  end

end
