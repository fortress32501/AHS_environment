class Event < ApplicationRecord
    validates :event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, presence: true
end
