class MainController < ApplicationController
    def index
        current_user.is_admin?
        current_user.assign_ranking
        current_user.update_all
    end

end