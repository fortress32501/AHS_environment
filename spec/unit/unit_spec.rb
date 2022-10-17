# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Event, type:  :model do
    subject do
        described_class.new(
            event_title: '1st Meeting', 
            event_description: 'General Meeting', 
            event_points: 5, 
            event_passcode: 'Test',
            event_location: 'ZACH-350',
            event_start: DateTime.new(2022, 9, 18, 8, 10),
            event_end: DateTime.new(2022, 9, 18, 9, 0)
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
        subject.event_description = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without event points' do
        subject.event_points = nil 
        expect(subject).not_to be_valid 
    end 

    # it 'is invalid with negative event points' do
    #     subject.event_points = -1
    #     expect(subject).not_to be_valid
    # end 

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

RSpec.describe User, type:  :model do
    subject do
        described_class.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: '123', point: 0, is_admin: false)
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


# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Attendance, type:  :model do


    subject do
        described_class.new(user_id: 1 ,event_id: 1,password: "Test", points: 5)
    end


    it 'is valid with valid attributes' do
        expect(subject).not_to be_valid
    end

    it 'is valid with no password or points' do
        subject.points = nil
        subject.password = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid with out user/ cannot have an invalid user' do
        subject.user_id = 56
        expect(subject).not_to be_valid
    end

    it 'is invalid with nonexistant event' do
        subject.event_id = 400
        expect(subject).not_to be_valid
    end

end

RSpec.describe AdminRequest, type: :model do 
    before(:each) do
        @user = User.create!(
            id: 1,
            first_name: "testUser",
            last_name: "1",
            email: "testUser1@email.com",
            password: "testUser1!Hello",
            point: 0,
            is_admin: false
        )
    end
    
    subject do 
        described_class.new(id: 1, user_id: @user.id, request_status: "REQUESTED", request_reason: "new officer in org")
    end

    it 'is valid with valid attributes' do 
        expect(subject).to be_valid
    end 

    it 'is invalid without user_id' do
        subject.user_id = nil 
        expect(subject).not_to be_valid 
    end

    it 'is invalid without request_status' do
        subject.request_status = nil 
        expect(subject).not_to be_valid 
    end

    it 'is invalid without request_reason' do
        subject.request_reason = nil
        expect(subject).not_to be_valid
    end
end
# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Event, type:  :model do

    subject do
        described_class.new(
            event_title: '1st Meeting', 
            event_description: 'General Meeting', 
            event_points: 5, 
            event_passcode: 'Test',
            event_location: 'ZACH-350',
            event_start: DateTime.new(2022, 9, 18, 8, 10),
            event_end: DateTime.new(2022, 9, 18, 9, 0),
            event_type_id: '1'
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
        subject.event_description = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without event points' do
        subject.event_points = nil 
        expect(subject).not_to be_valid 
    end 

    # it 'is invalid with negative event points' do
    #     subject.event_points = -1
    #     expect(subject).not_to be_valid
    # end 

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

    it 'is valid without a event_type_id' do
        subject.event_type_id = nil 
        expect(subject).to be_valid
    end

end

RSpec.describe User, type:  :model do
  subject do
    described_class.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: '123', point: 0, is_admin: false)
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

RSpec.describe Attendance, type:  :model do
  subject do
      described_class.new(user_id: 1 ,event_id: 1,password: "Test", points: 5)
  end  

  it 'is valid with valid attributes' do
    expect(subject).not_to be_valid
  end  

  it 'is valid with no password or points' do
    subject.points = nil
    subject.password = nil
    expect(subject).not_to be_valid
  end  

  it 'is invalid with out user/ cannot have an invalid user' do
    subject.user_id = 56
    expect(subject).not_to be_valid
  end  

  it 'is invalid with nonexistant event' do
    subject.event_id = 400
    expect(subject).not_to be_valid
  end
end

#Unit tests for event type
RSpec.describe EventType, type: :model do
    subject do
        described_class.new(type_name: "test", description: "test", color: "#FFFFFF")
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is invalid without type_name' do
        subject.type_name = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without description' do
        subject.description = nil
        expect(subject).not_to be_valid
    end

    it 'is invalid without color' do
        subject.color = nil
        expect(subject).not_to be_valid
    end
end

RSpec.describe Ranking, type:  :model do


    subject do
        described_class.new(title: "Diamond", point_total: 5)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is valid with no points' do
        subject.point_total = nil
        expect(subject).to be_valid
    end

    it 'is invalid with out title' do
        subject.title = nil
        expect(subject).to be_valid
    end

end


