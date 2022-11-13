# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :event_type, optional: true
  has_many :users, through: :attendance
  has_many :attendance
  validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title,
            :event_location, presence: true

  # find attendance for current event and sort attendees by roles (admin comes first)
  def attendees
    User.joins(:attendance).where(attendances: { event_id: id }).order('is_admin DESC')
  end
  
  # check whether user is already signed up for event
  def attendance_exist(user_id)
    Attendance.where(event_id: self.id, user_id: user_id)
  end
end
