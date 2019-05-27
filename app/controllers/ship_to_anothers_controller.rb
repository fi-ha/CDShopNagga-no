class ShipToAnothersController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def create
  end

  def update
  end

  private
  # httpリクエストのPOSTの時に内部に流れてきたgenreキーを持つパラメータをコントローラ内部に受け取ることを許可する
    def ship_to_another_params
      params.require(:ship_to_another).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address)
    end
end
