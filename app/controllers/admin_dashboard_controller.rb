class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    #should display all traders
    @traders = User.where(user_type: 'trader')
  end

  def new
  end

  def create
    #post new trader
  end

  def edit
  end

  def update
    #post edit for existing trader: edit email, password
  end

  def destroy
    #delete a trader
  end

  private

  def check_admin
    redirect_to secured_assets_path unless current_user.user_type == 'admin'
  end
end
