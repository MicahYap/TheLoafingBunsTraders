class TraderStocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trader_stock, only: [:destroy]

  def index
    @trader_stocks = current_user.trader_stocks.includes(:stock)
  end

  #to do 
  def buy
    if current_user.user_type == 'trader'
      stock = Stock.find(params[:id])
      current_user.stocks << stock
      redirect_to trader_stocks_path
    end
  end

  
  def destroy
    @trader_stock.destroy!

    respond_to do |format|
      format.html { redirect_to trader_stocks_url, notice: "Stock successfully sold." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trader_stock
      @trader_stock = TraderStock.find(params[:id])
    end
end
