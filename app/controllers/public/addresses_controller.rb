class Public::AddressesController < ApplicationController

 def index
  @address = Address.new
  @addresses = current_member_address
 end

 def create
  @address = Address.new(address_params)
	 @address.member_id = current_member.id
  @addresses = current_member_address
	 @address.save
	 flash.now[:notice] = "新規配送先を登録しました"
 end

 def edit
  @address = Address.find(params[:id])
 end

 def update
  @address = Address.find(params[:id])
  if @address.update(address_params)
   flash[:success] = "配送先を変更しました"
   redirect_to members_addresses_path
  else
   render "edit"
  end
 end

 def destroy
  @address = Address.find(params[:id])
	 @address.destroy
  @addresses = current_member_address.shipping_address
  flash.now[:alert] = "配送先を削除しました"
 end

 private
 def address_params
  params.require(:address).permit(:postal_code, :address, :name)
 end
end
