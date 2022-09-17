module ApplicationHelper
    def logged_in? 
        !!session[:users_id]
    end 

    def current_user
        @current_user ||= Users.find_by_id(session[:users_id]) if !!session[:users_id]

    end
end
