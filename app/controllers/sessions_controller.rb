class SessionsController < ApplicationController
  
   def new
    
   end
   
   def create
    user = User.find_by(user_id: params[:session][:user_id])
    user1 = User.find_by(email: params[:session][:email])
    if user && user1
        #session[:user_id] = user.id     
        #flash[:success] = {:class => :flashMessage}
        session[:session_token] = user.session_token
        flash[:success] = "You have successfully logged in"
        redirect_to movies_path
    else
        #flash.now[:danger] = {:class => :flashMessage}
        flash.now[:danger] = "There was something wrong with your login information"
        render 'new'
        #redirect_to login_path
    end
   end
   
   def destroy
       #session[:user_id] = nil
       session[:session_token] = nil
       #flash[:success] = {:class => :flashMessage}
       flash[:success] = "You have logged out"
       redirect_to movies_path
   end
   
end