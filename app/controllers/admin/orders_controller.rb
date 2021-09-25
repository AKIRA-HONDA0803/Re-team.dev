class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @order_products = @order.order_products
  @sum = 0
 end

 def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
   flash[:success] = "注文ステータスを変更しました"
   if @order.order_status == "入金確認"
    order_products = @order.order_products
    order_products.each do |order_product|
     order_product.making_status = "製作待ち"
     order_product.save
    end
   end
   redirect_to admin_order_path(@order)
  else
     render "show"
  end
 end

 private
	def order_params
	 params.require(:order).permit(:order_status)
	end

end
