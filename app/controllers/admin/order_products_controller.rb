class Admin::OrderProductsController < ApplicationController

  def update
   @order_product = OrderProduct.find(params[:id])
   @order_product.update(order_product_params)
   flash[:success] = "制作ステータスを変更しました"
   redirect_to admin_order_path(@order_product.order)
  end

 private

 def order_productl_params
	params.require(:order_product).permit(:order_status)
 end
end
