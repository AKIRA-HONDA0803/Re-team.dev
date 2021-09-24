class Public::OrdersController < ApplicationController
 def new
  @order = Order.new
  @member = current_member
  @addresses = Address.where(member: current_member)
 end

 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end

 def create
  @order = current_member.orders.new(order_params)
  @order.save
  flash[:notice] = "ご注文を確認しました。"
 end

 def confirm
  @order = Order.new
  @member = current_member
  @addresses = Address.where(member_id: current_member.id)
  @cart_products = current_member.cart_products
 end

 def index
  @orders = current_member.orders
 end

 private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end
  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end