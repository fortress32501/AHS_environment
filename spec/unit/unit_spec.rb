# location: spec/unit/unit_spec.rb
require 'rails_helper'



RSpec.describe Event, type:  :model do
    subject do
        described_class.new(event_title: '1st Meeting', event_description: 'General Meeting', event_points: 5, event_start: '2020-12-06-01-43', event_end: '2020-12-06-02-43', event_passcode: 'Test', event_location: 'ZACH')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    # it 'is invalid with negative points' do
    #     subject.points = -1
    #     expect(subject).not_to be_valid
    # end

    it 'is invalid with out title' do
        subject.event_title = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without description' do
        subject.event_description = nil
        expect(subject).not_to be_valid
    end
end