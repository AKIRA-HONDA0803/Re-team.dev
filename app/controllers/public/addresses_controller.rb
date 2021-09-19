class Public::AddressesController < ApplicationController

 def index
    @address = Address.new
    @addresses = Address.where(member_id: current_member.id)
 end

 def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.where(member_id: current_member.id)
      render :index
    end
 end

 def edit
  @address = Address.find(params[:id])
 end

 def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
 end

 def destroy
      address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
 end
 private

  def address_params
    params.require(:address).permit(:address, :postal_code, :name)
  end

end
