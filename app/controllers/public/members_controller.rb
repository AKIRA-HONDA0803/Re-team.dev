class Public::MembersController < ApplicationController

 def show
  @member = current_member
 end

 def edit
  @member = current_member
 end

 def update
  @member = current_membe
  @member.update(member_params)
  flash[:success] = "変更しました"
 end

 def unsubscribe
 end

 def withdraw
 end

 private
 def member_params
  params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_numbar)
 end
end
