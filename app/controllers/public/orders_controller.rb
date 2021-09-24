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
  @order.shipping_fee= 800
  @order.payment_method = params[:order][:payment_method]

        if params[:order][:select_address] == "0"
            @order.postal_code = current_member.postal_code
            @order.address = current_member.address
            @order.name = current_member.last_name + current_member.first_name
        elsif params[:order][:select_address] == "1"
            @address = Address.find(params[:order][:address_selection])
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
        elsif params[:order][:select_address] == "2"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:address]
            @order.name = params[:order][:name]

            address = Address.new
            address.member_id = current_member.id
            address.postal_code = @order.postal_code
            address.address = @order.address
            address.name = @order.name
            address.save
        end
 end

 def complete
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