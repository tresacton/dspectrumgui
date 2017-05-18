class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_user!


  private

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :current_password)
  end
end
