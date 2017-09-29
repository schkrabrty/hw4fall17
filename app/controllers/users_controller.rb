class UsersController < ApplicationController
    
    def new
       @user = User.new 
    end
    
    def create
       @user = User.new(user_params)
       if @user.save
           #flash[:notice] = {:class => :flashMessage}
           flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
           redirect_to login_path
       else
           render 'new'
       end
    end
    
    private
        def user_params
            params.require(:user).permit(:user_id, :email)
        end
end