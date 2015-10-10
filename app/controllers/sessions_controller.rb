class SessionsController < ApplicationController

  def create

       email = params[:email]
       password = params[:password]
       user = User.find_by email: email
       if user.present? && user.authenticate(password)
         sign_in user
         redirect_to root_path
       else
         flash.now[:alert] =  "Something is wrong with your email or password. Try gain."
         render :new
       end

     end

     def delete
       sign_out
       redirect_to root_path, notice: "You are now signed out. Thank you come again"
     end


end
