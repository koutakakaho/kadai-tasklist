module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        p current_user
        if current_user
            return true
        else
            return false
        end
    end
end
