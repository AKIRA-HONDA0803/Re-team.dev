class Public::HomesController < ApplicationController

 def top
  @products = Product.page(params[:page]).per(4).order('updated_at DESC')
 end

 def about
 end

end
