class Public::CartProductsController < ApplicationController

 def index
  @cart_products = CartProduct.where(member_id: current_member.id)
  @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  #@cart_products = current_cart
 end

 def create
  @cart_product = current_member.CartProduct.new(cart_product_params)
  @update_cart_prduct =  CartProduct.find_by(product: @cart_product.product)
   if @update_cart_prduct.present? && @cart_product.valid?
   @cart_product.quantity += @update_cart_prduct.quantity
   @update_cart_prduct.destroy
   end

   if @cart_product.save
   flash[:notice] = "#{@cart_product.product.name}をカートに追加しました"
   else
   @product = Product.find(params[:cart_product][:product_id])
   @cart_product = CartProduct.new
   flash[:alert] = "個数を選択してください"
   render("members/products/show")
   end
 end

#   def create

#     @cart_products = CartProduct.where(customer_id: current_customer.id)
#     @cart_products.each do |cart_product|
#       if cart_product.product_id == @cart_product.product_id
#         new_total_price = cart_product.total_price + @cart_product.total_price
#         cart_product.update_attribute(:total_price, new_total_price)
#         @cart_product.delete
#       end
#     end
#     @cart_product.save
#     redirect_to cart_products_path
#   end

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
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_products_path
  end



#   @cart_product.destroy
#   flash.now[:alert] = "#{@cart_product.product.name}を削除しました"
#   @cart_products = current_cart
#   @total = total_price(@cart_products).to_s
#  end

#  def update
#   @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
#   flash.now[:success] = "#{@cart_product.product.name}の数量を変更しました"
#   @price = sub_price(@cart_product).to_s(:delimited)
#   @cart_items = current_cart
#   @total = total_price(@cart_products).to_s(:delimited)
#  end



 private
  def cart_product_params
   params.require(:cart_product).permit(:quantity, :product_id, :member_id)
  end

end
