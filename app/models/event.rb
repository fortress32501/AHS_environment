class Event < ApplicationRecord
    validates :title, presence: true 
    validates :section, presence: true
    validates :schedule, presence: true
    validates :points, presence: true, numericality: {min: 0}
    validates :passcode, presence: true
end
