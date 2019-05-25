class ItemCartsController < ApplicationController

  before_action :authenticate_user!

  def new
  	@item_cart = ItamCart.new

  def update
  	@item_cart = ItemCart.find(params[:id])
  	@item_cart.update(item_cart_params)
  	redirect_to edit_cart_path(@item_cart.cart_id)
  end

  def destroy
  	@item_cart = ItemCart.find(params[:id])
  	@item_cart.destroy
  	redirect_to edit_cart_path(@item_cart.cart_id)
  end

  private

  def item_cart_params
  	params.require(:item_cart).permit(:count)
  end

end
