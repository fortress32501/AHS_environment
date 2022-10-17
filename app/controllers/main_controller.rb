class MainController < ApplicationController
    def index
        current_user.is_admin?
    end
end