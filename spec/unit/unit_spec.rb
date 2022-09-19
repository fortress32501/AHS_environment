# location: spec/unit/unit_spec.rb
require 'rails_helper'



RSpec.describe Event, type:  :model do
    subject do
        described_class.new(
            event_title: '1st Meeting', 
            event_description: 'General Meeting', 
            event_points: 5, 
            event_passcode: 'Test'
            event_location: 'ZACH-350'
            event_start: Date.new(2022, 9, 18, 8, 10)
            event_end: Date.new(2022, 9, 18, 9, 0)
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is invalid with out event title' do
        subject.event_title = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without event description' do
        subject.event_section = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without event points' do
        subject.event_points = nil 
        expect(subject).not_to be_valid 
    end 

    it 'is invalid with negative event points' do
        subject.event_points = -1
        expect(subject).not_to be_valid
    end 

    it 'is invalid without an event passcode' do
        subject.event_passcode = nil 
        expect(subject).not_to be_valid 
    end

    it 'is invalid without an event location' do
        subject.event_location = nil 
        expect(subject).not_to be_valid
    end

    it 'is invalid without en event start' do 
        subject.event_start = nil 
        expect(subject).not_to be_valid
    end

    it 'is invalid without an event end' do
        subject.event_end = nil 
        expect(subject).not_to be_valid
    end
end