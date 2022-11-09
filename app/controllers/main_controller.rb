class MainController < ApplicationController
    def index
        current_user.is_admin?
        current_user.update_all_rankings
    end

end