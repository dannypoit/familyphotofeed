class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end
