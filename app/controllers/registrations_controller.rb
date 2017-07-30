class RegistrationsController < Devise::RegistrationsController
    include Accessible



   private
    def sign_up_params
      params.require(:organisation).permit(:organisation_name,:email,:password,:password_confirmation).merge(subdomain: params[:organisation][:organisation_name].parameterize)
    end

    def account_update_params
      params.require(:organisation).permit(:organisation_name,:email,:password,:password_confirmation,:current_password)
    end

#  def after_sign_up_path_for(resource)
#     after_sign_in_path_for(resource)
#   end
    def  after_sign_up_path_for(organisations)
        "/dashboard"
    end
end