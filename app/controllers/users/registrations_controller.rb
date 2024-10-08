# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.user_type = 'trader'
    resource.status = 'pending'

    if resource.save
      pending_approval_email(resource)
      flash[:notice] = 'Thanks for creating an account with us! Your account is pending review and approval.'
      redirect_to root_path
    else
      respond_with resource
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,:birthday, :gender, :address, :cp_number)
  end

  def pending_approval_email(trader)
    UserMailer.with(trader: trader).pending_approval.deliver_now
    admins = User.where(user_type: 'admin')
    admins.each do |admin|
      UserMailer.with(admin: admin).new_account_for_approval.deliver_now
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
