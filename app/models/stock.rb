class Stock < ApplicationRecord
  has_many :trader_stocks
  has_many :traders, through: :trader_stocks, source: :user
end
