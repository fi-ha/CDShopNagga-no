class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
	edit_user_registration_path
  end

  def after_sign_in_path_for(resource)
	edit_user_registration_path
  end

  def after_sign_out_path_for(resource)
	new_user_registration_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :addres, :phone_number, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end


end
