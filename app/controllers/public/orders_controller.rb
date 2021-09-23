class Public::OrdersController < ApplicationController
 def new
  @order = Order.new
  @addresses = current_member.addresses
  @address = Address.new
  # @new_address = Address.new
  # @addresses = Address.where(member: current_member)
 end

 def show
  @order = Order.find(params[:id])
  @order_status = @order.order_status
  @orders = @order.order_products
 end

 def create
  @order = Order.new(order_params)
  @order.member = current_member
  @cart_products = current_member.cart_products

   if @order.save
  flash[:notice] = "ご注文を確認しました。"
  redirect_to orders_complete_path



  cart_products = current_member.cart_products
   cart_products.each do |item|
       order_product = OrderProduct.new
       order_product.order_id = @order.id
       order_product.product_id = item.product.id
       order_product.quantity = item.quantity
       order_product.total_price = item.quantity*item.product.price
       order_product.making_status = 0
       order_product.save
      end
       current_member.cart_products.destroy_all
   end
 end

 def confirm
  @order = Order.new(order_params)
  @member = current_member
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
        end
 end

 def complete
 end

 def index
  @orders = current_member.orders
 end

 private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method,:shipping_fee,:bill,:order_status )
  end
  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end