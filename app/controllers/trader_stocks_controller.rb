class TraderStocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trader_stock, only: [:destroy]

  def index
    @trader_stocks = current_user.trader_stocks.includes(:stock)
  end

  def buy
    if current_user.user_type == 'trader'
      stock = Stock.find(params[:id])

      if current_user.money>= stock.price
        new_money = current_user.money - stock.price
        current_user.update_column(:money, new_money)
        current_user.reload
        current_user.stocks << stock
        Transaction.create(user: current_user, stock: stock, amount: stock.price, balance: new_money, transaction_type: 'buy')
      else
        flash[:notice] = 'Insufficient balance'
      end
      redirect_to trader_stocks_path
    end
  end
  
  def destroy
    stock = @trader_stock.stock
    stock_price = stock.price
    new_money = current_user.money + stock_price

    @trader_stock.destroy!
    current_user.update_column(:money, new_money)
    current_user.reload
    Transaction.create(user: current_user, stock: stock, amount: stock_price, balance: new_money, transaction_type: 'sell')
    flash[:notice] = 'Stocks sold successfully!'
    redirect_to trader_stocks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trader_stock
      @trader_stock = TraderStock.find(params[:id])
    end
end
