class Public::MembersController < ApplicationController

  before_action :configure_permitted_parameters, if: :devise_controller?

 def show
  @member = current_member
 end

 def edit
  @member = current_member
 end

 def update
  @member = current_member
  if @member.update(member_params)
     flash[:success] = "変更しました"
     redirect_to  members_my_page_path
  else
   render :edit and return
  end
 end

 def unsubscribe
 end

 def withdraw
 end

 private
 def member_params
  params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_numbar)
 end

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address, :phone_number])
 end
end
