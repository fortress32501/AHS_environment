class HistoryController < ApplicationController
  def index
    @attendances = Attendance.all
    @users = User.all
  end
end