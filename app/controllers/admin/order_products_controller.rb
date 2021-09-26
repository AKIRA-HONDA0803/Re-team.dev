class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
   @order_product = OrderProduct.find(params[:id])
   @order_product.update(order_product_params)

    order = @order_product.order
    @order_products = order.order_products
    ordered_items_completed = @order_products.where(making_status: "製作完了" )
    if @order_product.making_status == "製作中"
      @order_product.order.order_status = "製作中"
      @order_product.order.save
    elsif @order_products.count == ordered_items_completed.count
      @order_product.order.order_status = "発送準備中"
      @order_product.order.save
    end
   flash[:success] = "製作ステータスを変更しました"

   redirect_to admin_order_path(@order_product.order)
  end

 private

 def order_product_params
	params.require(:order_product).permit(:making_status)
 end
end
