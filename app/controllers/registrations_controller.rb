class RegistrationsController < Devise::RegistrationsController


  def profile
   if !seller_signed_in?
     redirect_to new_seller_registration_path
   end
  end

  private
    def sign_up_params
      params.require(:seller).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:seller).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
