class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
   @order_product = OrderProduct.find(params[:id])
   @maked_products = @order_product.where(making_status: '製作完了')
   @order_product.update(order_product_params)

   if @order_product.making_status == "製作中" && @order_product.order.status == "入金確認"
      @order_product.order.update(status: "製作中")
      flash[:success] = "製作ステータスを変更しました"
   elsif @maked_products.count == @order_items.count
      @order_product.order.update(status: "発送準備中")
    redirect_to admin_order_path(@order_product.order_id)
   end
   flash[:success] = "製作ステータスを変更しました"
   redirect_to admin_order_path(@order_product.order)
  end

 private

 def order_product_params
	params.require(:order_product).permit(:making_status)
 end
end
