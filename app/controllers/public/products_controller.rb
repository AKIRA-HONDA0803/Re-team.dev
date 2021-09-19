class Public::ProductsController < ApplicationController

 def index
  @genres = Genre.all
  # @products = Product.where(is_sale: true)
   @products = Product.all
 end

 def show
  @products = Product.all
  @product = Product.find(params[:id])
 end

 private
	def product_params
		parmas.require(:product).permit(:image ,:name, :description, :tax_out_price, :is_sale)
	end
end
