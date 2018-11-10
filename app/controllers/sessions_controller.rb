class SessionsController < ApplicationController
    def new
    end
    
    def create
        email = params[:session][:email].downcase
        password = params[:session][:password]
        if login(email, password)
            flash[:success]="ログインに成功しました"
            redirect_to @user
        else
            flash[:danger]="ログインに失敗しました"
            render "new"
        end
    end
    
    def destory
        session[:user_id]=nil
        redirect_to login_url
    end
    
    
    private
    def login(email, password)
        @user = User.find_by(email: email)
        if @user && @user.authenticate(password)
            session[:id]=@user.id
            return true
        else 
            return false
        end
            
    end
end
