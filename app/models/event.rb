class Event < ApplicationRecord
  belongs_to :event_type, :optional => true
  has_many :users, through: :attendance 
  validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true
  
  # find attendance for current event
  def attendees
    Attendance.where(:event_id => self.id).all
  end
  
  # find user first and last name by id
  def find_name(user_id)
    User.find(user_id).last_name + ", " +User.find(user_id).first_name
  end
  
  # show 3 recent activities on account page
  def recent_events
    Event.order('event_start DESC').limit(3)
  end

end




    