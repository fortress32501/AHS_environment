class Event < ApplicationRecord
  belongs_to :event_type, :optional => true
  has_many :users, through: :attendance 
  validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true
  
  # find attendance for current event
  def attendees
    Attendance.where(:event_id => self.id).all
  end

  # show 3 recent activities on account page
  def self.recent_events
    Event.order('event_start DESC').limit(3)
  end

end




    
