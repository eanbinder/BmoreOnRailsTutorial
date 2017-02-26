class SessionsController < ApplicationController
    def new
        #empty method is okay because Rails renders new.html.erb by default unless you tell it otherwise
    end
    
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "Welcome back, #{user.username}!"
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:alert] = "Your username or password is invalid."
            render :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Bye I guess"
        redirect_to root_path
    end
    
    def show
        redirect_to new_session_path
    end

   
end