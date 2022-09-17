class Event < ApplicationRecord
    validates :title, presence: true 
    validates :section, presence: true
    validates :schedule, presence: true
    validates :points, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :passcode, presence: true
end
