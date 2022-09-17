# location: spec/unit/unit_spec.rb
require 'rails_helper'



RSpec.describe Event, type:  :model do
    subject do
        described_class.new(
            title: '1st Meeting', 
            section: 'General Meeting', 
            points: 5, 
            schedule: '2020-12-06-01-43', 
            passcode: 'Test'
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    # it 'is invalid with negative points' do
    #     subject.points = -1
    #     expect(subject).not_to be_valid
    # end

    it 'is invalid with out title' do
        subject.title = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without section' do
        subject.section = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without schedule' do
        subject.schedule = nil
        expect(subject).not_to be_valid
    end
end