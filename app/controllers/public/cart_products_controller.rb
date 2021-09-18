class Public::CartProductsController < ApplicationController

 def index
 
  @cart_products = CartProduct.where(member_id: current_member.id)
 end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_total_price = cart_product.total_price + @cart_product.total_price
        cart_product.update_attribute(:total_price, new_total_price)
        @cart_product.delete
      end
    end
    @cart_product.save
    redirect_to cart_products_path
  end

 def destroy
　cart_product = CartProduct.find(params[:id])
  cart_product.destroy
  redirect_to cart_products_path
 end

 def update
  @cart_product = CartProduct.find(params[:id])
   if @cart_product.update(cart_product_params)
   redirect_to cart_products_path
   end
 end

  def destroy_all
    cart_products = CartProduct.where(member_id: current_member.id)
    cart_products.destroy_all
    redirect_to cart_products_path
  end
  
    private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :member_id, :total_price)
  end

end
