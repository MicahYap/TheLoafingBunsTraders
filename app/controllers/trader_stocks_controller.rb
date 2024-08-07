class TraderStocksController < ApplicationController
  before_action :set_trader_stock, only: [ :show, :destroy, :buy ]

  # GET /trader_stocks or /trader_stocks.json
  def index
    @trader_stocks = TraderStock.all
  end

  # GET /trader_stocks/1 or /trader_stocks/1.json
  def show
  end

  def buy
    if current_user.user_type == 'trader'
      stock = Stock.find(params[:stock_id])
      current_user.stocks << stock
      redirect_to trader_stocks_path, notice: 'Stock was successfully added.'
    else
      redirect_to trader_stocks_path, alert: 'Only traders can add stocks.'
    end
  end

  # GET /trader_stocks/new
  def new
    @trader_stock = TraderStock.new
  end

  # GET /trader_stocks/1/edit
  def edit
  end

  # POST /trader_stocks or /trader_stocks.json
  def create
    @trader_stock = TraderStock.new(trader_stock_params)

    respond_to do |format|
      if @trader_stock.save
        format.html { redirect_to trader_stock_url(@trader_stock), notice: "Trader stock was successfully created." }
        format.json { render :show, status: :created, location: @trader_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trader_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trader_stocks/1 or /trader_stocks/1.json
  def update
    respond_to do |format|
      if @trader_stock.update(trader_stock_params)
        format.html { redirect_to trader_stock_url(@trader_stock), notice: "Trader stock was successfully updated." }
        format.json { render :show, status: :ok, location: @trader_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trader_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trader_stocks/1 or /trader_stocks/1.json
  def destroy
    @trader_stock.destroy!

    respond_to do |format|
      format.html { redirect_to trader_stocks_url, notice: "Trader stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trader_stock
      @trader_stock = TraderStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trader_stock_params
      params.fetch(:trader_stock, {})
    end
end
