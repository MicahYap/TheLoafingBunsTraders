class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
  end

  def destroy
    super
  end

  private

  def check_admin
    redirect_to secured_assets_path unless current_user.user_type == 'admin'
  end
end
