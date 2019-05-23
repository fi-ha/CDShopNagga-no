class ItemCartsController < ApplicationController

  def new
  	@item_cart = ItamCart.new
  end

  def create
  end

  def update
  	@item_cart = ItemCart.find(params[:id])
  	@item_cart.update
  	redirect_to edit_cart_path(cart.id)
  end

  def destroy
  	@item_cart = ItemCart.find(params[:id])
  	@item_cart.destroy
  	redirect_to edit_cart_path(cart.id)
  end

  private

  def item_cart_params
  	params.require(:item_cart).permit(:item_id, :cart_id, :count, :price)
  end

end
