class TransactionsController < ApplicationController

  def index
    @transactions = current_user.transactions.includes(:stock)
  end
end
