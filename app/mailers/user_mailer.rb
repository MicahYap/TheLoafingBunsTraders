class UserMailer < ApplicationMailer
  def pending_approval
    @user = params[:user]
    
    mail(to: @user.email, subject: 'Your account is pending approval')
  end

  def new_account_for_approval
    @user = params[:user]
    mail(to: 'yapmicahsy@gmail.com', subject: 'New Trader for approval!')
  end

  def account_approved
    @user = params[:user]
    mail(to: @user.email, subject: 'Congratulations! Your account is approved!')
  end
end
