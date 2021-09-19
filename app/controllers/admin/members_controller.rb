class Admin::MembersController < ApplicationController

 def index
  @members = Member.all
 end

 def show
  @member = Member.find(params[:id])
 end

 def edit
  @member = Member.find(params[:id])
 end

 def update
  @member = Member.find(params[:id])
   if @member.update(member_params)
      flash[:success] = "会員情報を変更しました"
      redirect_to admin_member_path
   else
    render "edit"
   end
 end

 private
 	def customer_params
 	  params.require(:member).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:adress,:phone_number,:email,:is_valid)
 	end

end
