class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :balance, presence: true, numericality: {greater_than: 0}
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :transaction_type, presence: true, inclusion: {in: ['buy', 'sell']}
end
