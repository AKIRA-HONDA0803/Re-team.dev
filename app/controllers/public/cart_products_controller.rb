class Public::CartProductsController < ApplicationController

 def index
  @cart_products = current_cart
 end

 def create
  @cart_product = current_member.cart_products.new(params_cart_product)

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
   end
 end

 def destroy
  @cart_product.destroy
  flash.now[:alert] = "#{@cart_product.product.name}を削除しました"
  @cart_products = current_cart
  @total = total_price(@cart_products).to_s
 end

 def update
  @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
  flash.now[:success] = "#{@cart_product.product.name}の数量を変更しました"
  @price = sub_price(@cart_product).to_s(:delimited)
  @cart_items = current_cart
  @total = total_price(@cart_products).to_s(:delimited)
 end

 def destroy_all
  @cart_products = current_member.cart_products
  @cart_products.destroy_all
  flash[:alert] = "カートの商品を全て削除しました"
 end

 private

  def params_cart_product
   params.require(:cart_product).permit(:quantity, :product_id)
  end

end
