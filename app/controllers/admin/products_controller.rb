class Admin::ProductsController < ApplicationController
 def index
  @products = Product.all
 end

 def show
  @product = Product.find(params[:id])
 end

 def edit
 end

 def update
 end

 def new
  @product = Product.new
 end

 def create
 end

 def destroy
 end
  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :product_status, :image_id, :price, :created_at, :updated_at)
  end

end
