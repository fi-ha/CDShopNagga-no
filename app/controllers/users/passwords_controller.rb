# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  protected

  def after_resetting_password_path_for(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
  end
end
