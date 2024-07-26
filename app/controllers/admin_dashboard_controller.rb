class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @traders = User.where(user_type: 'trader')
  end

  def new
    @trader = User.new
  end

  def create
    @trader = User.new(trader_params)
    @trader.user_type = 'trader'

    if @trader.save
      redirect_to admin_dashboard_index_path, notice: 'Trader was created successfully!'
    else
      flash.now[:alert] = 'Creation failed! Try again.'
      render :new
    end
  end

  def edit
    @trader = User.find(params[:id])
  end

  def update
    @trader = User.find(params[:id])
    if @trader.update(trader_params)
      redirect_to admin_dashboard_index_path, notice: 'Updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trader = User.find(params[:id])
    @trader.destroy
    redirect_to admin_dashboard_index_path, notice: 'Deleted successfully!'
  end

  private

  def check_admin
    redirect_to secured_assets_path unless current_user.user_type == 'admin'
  end

  def trader_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
