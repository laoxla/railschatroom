class UsersController < ApplicationController

  def new
       @user = User.new
     end

     def create
       @user = User.new params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation)
       if @user.save
         sign_in @user
         redirect_to root_path, notice: "Welcome to Railschatroom, #{@user.user_name}"
       else
         render :new
       end
     end


end
