class Event < ApplicationRecord
    validates :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true     
    validates :event_points, presence: true, numericality: {greater_than_or_equal_to: 0}

end
