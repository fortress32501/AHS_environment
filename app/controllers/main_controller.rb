# frozen_string_literal: true

class MainController < ApplicationController
  def index
    current_user.is_admin?
    current_user.assign_ranking
  end
end
