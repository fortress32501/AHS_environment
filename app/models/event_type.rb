class EventType < ApplicationRecord
	has_many :events
	validates :type_name, :description, :color, presence: true
end
