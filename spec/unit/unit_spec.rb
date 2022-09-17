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

RSpec.describe User, type:  :model do
    subject do
        described_class.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: '123', point: 0, privileges_id: 0)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is invalid without first name' do
        subject.first_name = nil 
        expect(subject).not_to be_valid
    end
    
    it 'is invalid without last name' do
        subject.last_name = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without email' do
        subject.email = nil
        expect(subject).not_to be_valid
    end
end
