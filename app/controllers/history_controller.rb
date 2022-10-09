class HistoryController < ApplicationController
  def index
    @attendances = Attendance.all
  end
end