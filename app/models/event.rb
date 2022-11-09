class Event < ApplicationRecord
  belongs_to :event_type, :optional => true
  has_many :users, through: :attendance 
  has_many :attendance
  validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true
  
  # find attendance for current event and sort attendees by roles (admin comes first)
  def attendees
    User.joins(:attendance).where(attendances: { event_id: self.id }).order("is_admin DESC")
  end
  
  # show 3 recent activities on account page
  def self.recent_events
    Event.order('event_start DESC').limit(3)
  end

end




    
