class Event < ApplicationRecord
    validates :title, presence: true 
    validates :section, presence: true
    validates :points, numericality: {min: 0}
end
