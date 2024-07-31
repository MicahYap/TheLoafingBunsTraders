class UserMailer < ApplicationMailer
  def pending_approval
    @trader = params[:trader]
    
    mail(to: @trader.email, subject: 'Your account is pending approval')
  end

  def new_account_for_approval
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'New Trader for approval!')
  end

  def account_approved
    @trader = params[:trader]
    mail(to: @trader.email, subject: 'Congratulations! Your account is approved!')
  end

  def account_denied
    @trader = params[:trader]
    mail(to: @trader.email, subject: 'Account Denied')
  end
end
