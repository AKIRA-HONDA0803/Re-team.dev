class Public::AddressesController < ApplicationController

 def index
    @address = Address.new
    @addresses = Address.where(member_id: current_member.id)
 end

 def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    if @address.save
      flash.now[:notice] = "新規配送先を登録しました"
      redirect_to addresses_path
    else 
      flash.now[:alert] = "失敗しました"
      @addresses = Address.where(member_id: current_member.id)
      render :index
    end
 end


 def edit
  @address = Address.find(params[:id])
 end

 

 def destroy
    address = Address.find(params[:id])
    address.destroy
    flash.now[:alert] = "配送先を削除しました"
    redirect_to addresses_path
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

 
  
	
  
 

 private
 def address_params
  params.require(:address).permit(:postal_code, :address, :name)
 end
end
