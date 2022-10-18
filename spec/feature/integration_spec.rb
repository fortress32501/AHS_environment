# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Event', type: :feature do
  scenario 'valid inputs' do
    visit new_event_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
 
    visit new_event_path
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2020', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select '2020', :from => 'event_event_end_1i'
    select 'September', :from => 'event_event_end_2i'
    select '28', :from => 'event_event_end_3i'
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('1st Meeting')
    expect(page).to have_content('General Meeting')
    expect(page).to have_content('5')
    expect(page).to have_content('Test')
    expect(page).to have_content('2020-09-28')
    expect(page).to have_content('01:43')
  end
end


RSpec.describe 'Show Events', type: :feature do
  scenario 'Show' do
    visit new_event_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'  
    visit new_event_path
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2020', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select '2020', :from => 'event_event_end_1i'
    select 'September', :from => 'event_event_end_2i'
    select '28', :from => 'event_event_end_3i'
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'
    visit events_path
    click_on 'Show'
    expect(page).to have_content('1st Meeting')
    expect(page).to have_content('General Meeting')
    expect(page).to have_content('2020-09-28')
    expect(page).to have_content('01:43')
    expect(page).to have_content('5')
    expect(page).to have_content('Test')
  end
end

RSpec.describe 'Delete Events', type: :feature do
  scenario 'Delete' do
    visit new_event_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'  
    visit new_event_path
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2020', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select '2020', :from => 'event_event_end_1i'
    select 'September', :from => 'event_event_end_2i'
    select '28', :from => 'event_event_end_3i'
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'
    visit events_path
    click_on 'Destroy'
  
    visit new_event_path
    expect(page).not_to have_content('1st Meeting')
    expect(page).not_to have_content('General Meeting')
  end
end

RSpec.describe 'Edit Events', type: :feature do
  scenario 'Edit' do
    visit new_event_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    
    visit new_event_path
    fill_in 'Event title', with: '1st Meeting'
    fill_in 'Event description', with: 'General Meeting'
    fill_in 'Event points', with: '5'
    fill_in 'Event passcode', with: 'Test'
    fill_in 'Event location', with: 'ZACH'
    select '2020', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select '2020', :from => 'event_event_end_1i'
    select 'September', :from => 'event_event_end_2i'
    select '28', :from => 'event_event_end_3i'
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'
    visit events_path
    click_on 'Edit'
    fill_in 'Event title', with: '2nd Meeting'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('2nd Meeting')
    expect(page).not_to have_content('1st Meeting')
  end
end

# Sign Up/ Login Integration Test
RSpec.describe 'Creating a User', type: :feature do
  scenario 'valid inputs' do  
    # Test Sign Up
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'Create Account'
    expect(page).to have_content('Jane')
    expect(page).to have_content('Doe')
    click_on 'account'
    click_on 'Sign out'
    
    # Test Login
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'Sign In!'
    expect(page).to have_content('Jane')
  end
end

"""
# Show user 
RSpec.describe 'Show user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'Create Account'  
    visit users_path
    click_on 'Show'
    expect(page).to have_content('Jane')
    expect(page).to have_content('Doe')
    expect(page).to have_content('jane@gmail.com')
  end
end
# Edit user 
RSpec.describe 'Edit user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'Create Account'  
    visit users_path
    click_on 'Edit'
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Point', with: '2'
    select 'false', :from => 'user_is_admin'
    click_on 'submit'  
    visit users_path
    click_on 'Show'
    expect(page).to have_content('Jane')
    expect(page).to have_content('Doe')
    expect(page).to have_content('2')
    expect(page).to have_content('false')
    expect(page).not_to have_content('0')
  end
end"""

# # Delete user 
# RSpec.describe 'Delete user', type: :feature do
#   scenario 'valid inputs' do
#     visit new_user_path
#     fill_in 'First name', with: 'Jane'
#     fill_in 'Last name', with: 'Doe'
#     fill_in 'Email', with: 'jane@gmail.com'
#     fill_in 'Password', with: '123'
#     click_on 'Create Account'
#     visit users_path
#     click_on 'Delete'
#     expect(page).not_to have_content('Jane')
#     expect(page).not_to have_content('jane@gmail.com')
#   end
# end

# #Edit user points
# RSpec.describe 'Edit user points', type: :feature do
#   scenario 'valid inputs' do
#     visit new_user_path
#     fill_in 'First name', with: 'Jane'
#     fill_in 'Last name', with: 'Doe'
#     fill_in 'Email', with: 'jane@gmail.com'
#     fill_in 'Password', with: '123'
#     click_on 'Create Account'
#     visit users_path
#     click_on 'Edit'
#     fill_in 'Point', with: 3
#     click_on 'Update User'
#     expect(page).to have_content(3)
#   end
# end

#points should not chnage if not edited
RSpec.describe 'Do not edit user points', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'Create Account'
    visit users_path
    click_on 'Edit'
    fill_in 'Point', with: 3
    click_on 'Update User'
    click_on 'Edit'
    click_on 'Cancel'
    expect(page).to have_content(3)
  end
end

# Test to make sure calendar renders on page
RSpec.describe 'Confirm Calendar', type: :feature do
  scenario 'Calendar' do  
    visit events_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    visit events_path
    
    expect(page).to have_content(Date.today.strftime("%B"))
    expect(page).to have_content('Sun')
    expect(page).to have_content('Mon')
    expect(page).to have_content('Tue')
    expect(page).to have_content('Wed')
    expect(page).to have_content('Thu')
    expect(page).to have_content('Fri')
    expect(page).to have_content('Sat') 
  end
end


RSpec.describe 'Attendance Testing', type: :feature do
  scenario 'valid inputs' do   
    visit events_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    

    visit new_event_path
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2020', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select '2020', :from => 'event_event_end_1i'
    select 'September', :from => 'event_event_end_2i'
    select '28', :from => 'event_event_end_3i'
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'  
    # prep completed test sign in to event
    click_on 'Sign In For Event'
    fill_in 'attendance_password', with: 'Test'
    select '1st Meeting', :from => 'attendance_event_id'
    
    click_on 'Create Attendance'
    expect(page).to have_content('Attendance was successfully created')
    expect(page).to have_content('test test')
    expect(page).to have_content('1st Meeting')
    expect(page).to have_content('5')
    #test show page
    click_on 'Back'
    expect(page).to have_content("Events")
    
    
    
     # Now test Event Password must be correct
    visit new_attendance_path
    fill_in 'attendance_password', with: 'fgf'
    select '1st Meeting', :from => 'attendance_event_id'  
    click_on 'Create Attendance'
    expect(page).not_to have_content('Attendance was successfully created')  
    # Now test attendnace already exists
    visit new_attendance_path
    fill_in 'attendance_password', with: 'Test'
    expect(page).not_to have_content('Attendance was successfully created')
  end
end

RSpec.describe 'Event Point Testing', type: :feature do
  scenario 'valid inputs' do
    # Signup    
    visit events_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    
    # Create event
    click_on 'Events'
    click_on 'New Event'
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2022', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select Date.today.year, :from => 'event_event_end_1i'                     # year
    select Date::MONTHNAMES[Date.today.month] , :from => 'event_event_end_2i' # month
    select Date.today.day, :from => 'event_event_end_3i'                      # date
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'  
    # Test hidden event point and edit link
    click_on 'Back'
    click_on '1st Meeting', match: :first
    expect(page).not_to have_content('Event points')
    expect(page).not_to have_content('Edit')     
  end
end

# Integration test for creating an event type
RSpec.describe 'Creating an EventType', type: :feature do
    scenario 'valid inputs' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
 
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'General Meeting'
        click_on 'Create Event type'
        visit event_types_path
        expect(page).to have_content('type1')
        expect(page).to have_content('General Meeting')
        expect(page).to have_content('#000000')
    end
end

# Integration test for showing an event type
RSpec.describe 'Showing an EventType', type: :feature do
    scenario 'valid inputs' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
 
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'General Meeting'
        click_on 'Create Event type'
        visit event_types_path
        click_on 'Show'
        expect(page).to have_content('type1')
        expect(page).to have_content('General Meeting')
        expect(page).to have_content('#000000')
        visit events_path
        expect(page).to have_content('type1')
    end
end

# Integration test for deleting an event type
RSpec.describe 'Deleting an EventType', type: :feature do
    scenario 'delete' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
 
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'General Meeting'
        click_on 'Create Event type'
        visit event_types_path
        click_on 'Destroy'
        expect(page).not_to have_content('type1')
        expect(page).not_to have_content('General Meeting')
        expect(page).not_to have_content('#000000')
        visit events_path
        expect(page).not_to have_content('type1')
    end
end

# Integration test for updating an event type
RSpec.describe 'Updating an EventType', type: :feature do
    scenario 'update' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
 
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'General Meeting'
        click_on 'Create Event type'
        visit event_types_path
        click_on 'Edit'
        fill_in 'Type name', with: 'type2'
        fill_in 'Description', with: 'different'
        click_on 'Update Event type'
        visit event_types_path
        expect(page).not_to have_content('type1')
        expect(page).not_to have_content('General Meeting')
        expect(page).to have_content('type2')
        expect(page).to have_content('different')
        visit events_path
        expect(page).not_to have_content('type1')
        expect(page).to have_content('type2')
    end
end

# Integration test between event type and event
RSpec.describe 'Creating an Event with EventType', type: :feature do
    scenario 'valid inputs' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
        
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'test type'
        click_on 'Create Event type'

        visit new_event_path
        fill_in 'title', with: '1st Meeting'
        fill_in 'description', with: 'General Meeting'
        fill_in 'points', with: '5'
        fill_in 'passcode', with: 'Test'
        fill_in 'location', with: 'ZACH'
        select '2020', :from => 'event_event_start_1i'
        select 'September', :from => 'event_event_start_2i'
        select '28', :from => 'event_event_start_3i'
        select '01', :from => 'event_event_start_4i'
        select '43', :from => 'event_event_start_5i'
        select '2020', :from => 'event_event_end_1i'
        select 'September', :from => 'event_event_end_2i'
        select '28', :from => 'event_event_end_3i'
        select '02', :from => 'event_event_end_4i'
        select '43', :from => 'event_event_end_5i'
        select 'type1', :from => 'event_event_type_id'
        click_on 'Create Event'

        visit events_path
        expect(page).to have_content('1st Meeting')
        expect(page).to have_content('General Meeting')
        expect(page).to have_content('5')
        expect(page).to have_content('Test')
        expect(page).to have_content('ZACH')
        expect(page).to have_content('2020-09-28')
        expect(page).to have_content('01:43')
        expect(page).to have_content('type1')

        visit event_types_path
        expect(page).to have_content('type1')
        expect(page).to have_content('test type')
        expect(page).to have_content('#000000')
    end
end

RSpec.describe 'Creating an Event without EventType', type: :feature do
    scenario 'valid inputs' do
        visit new_event_type_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
        
        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'test type'
        click_on 'Create Event type'

        visit new_event_path
        fill_in 'title', with: '1st Meeting'
        fill_in 'description', with: 'General Meeting'
        fill_in 'points', with: '5'
        fill_in 'passcode', with: 'Test'
        fill_in 'location', with: 'ZACH'
        select '2020', :from => 'event_event_start_1i'
        select 'September', :from => 'event_event_start_2i'
        select '28', :from => 'event_event_start_3i'
        select '01', :from => 'event_event_start_4i'
        select '43', :from => 'event_event_start_5i'
        select '2020', :from => 'event_event_end_1i'
        select 'September', :from => 'event_event_end_2i'
        select '28', :from => 'event_event_end_3i'
        select '02', :from => 'event_event_end_4i'
        select '43', :from => 'event_event_end_5i'
        click_on 'Create Event'

        visit events_path
        expect(page).to have_content('1st Meeting')
        expect(page).to have_content('General Meeting')
        expect(page).to have_content('5')
        expect(page).to have_content('Test')
        expect(page).to have_content('ZACH')
        expect(page).to have_content('2020-09-28')
        expect(page).to have_content('01:43')
        expect(page).to have_content('type1')
        # When a EventType isn't chosen
        expect(page).to have_content('None')

        #test show page
        #click_on 'Back'
        #expect(page).to have_content("Events")

        
         # Now test Event Password must be correct

        #visit new_attendance_path
        #fill_in 'attendance_password', with: 'fgf'
        #select '1st Meeting', :from => 'attendance_event_id'

        #click_on 'Create Attendance'
        #expect(page).not_to have_content('Attendance was successfully created')


        # Now test attendnace already exists
        #visit new_attendance_path
        #fill_in 'attendance_password', with: 'Test'
        #expect(page).not_to have_content('Attendance was successfully created')

        visit event_types_path
        expect(page).to have_content('type1')
        expect(page).to have_content('test type')
        expect(page).to have_content('#000000')

    end
end


RSpec.describe 'User viewable point testing', type: :feature do
  scenario 'valid inputs' do
    # Signup    
    visit events_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    
    # Create event
    click_on 'Events'
    click_on 'New Event'
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2022', :from => 'event_event_start_1i'
    select 'September', :from => 'event_event_start_2i'
    select '28', :from => 'event_event_start_3i'
    select '01', :from => 'event_event_start_4i'
    select '43', :from => 'event_event_start_5i'
    select Date.today.year, :from => 'event_event_end_1i'                     # year
    select Date::MONTHNAMES[Date.today.month] , :from => 'event_event_end_2i' # month
    select Date.today.day, :from => 'event_event_end_3i'                      # date
    select '02', :from => 'event_event_end_4i'
    select '43', :from => 'event_event_end_5i'
    click_on 'Create Event'  
    
    # Create attendance
    click_on 'Sign In For Event'
    fill_in 'attendance_password', with: 'Test'
    click_on 'Create Attendance'

    # Go to account page
    click_on 'account'
    expect(page).to have_content('Attendance points')
    expect(page).to have_content('Attendance points: 5')
    expect(page).not_to have_content('Attendance points: 0')  
    
    # Test attendance history
    click_on 'full attendance history'
    expect(page).to have_content('1st Meeting')
  end
end

RSpec.describe 'Creating an Admin Request', type: :feature do
    scenario 'valid inputs' do
        visit new_admin_request_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'
 
        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'
        visit admin_requests_path
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
        # need to figure out how to see what the date the request ^^ was generated
        # this would vary with every time the test case is run
        # expect(page).to have_content('2020-09-28')
        # expect(page).to have_content('01:43')
    end

    scenario 'valid inputs for multiple' do
        visit new_admin_request_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'

        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'
        visit admin_requests_path
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
        # need to figure out how to see what the date the request ^^ was generated
        # this would vary with every time the test case is run
        # expect(page).to have_content('2020-09-28')
        # expect(page).to have_content('01:43')

        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test 2'
        click_on 'Create Admin request'
        visit admin_requests_path
        # make sure they are both there, not just the new one created 
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test 2')
    end
end


RSpec.describe 'Show Admin Requests', type: :feature do
    scenario 'Show' do
        visit new_admin_request_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'

        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'
        visit admin_requests_path
        click_on 'Show'
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
        # need to figure out how to see what the date the request ^^ was generated
        # this would vary with every time the test case is run
        # expect(page).to have_content('2020-09-28')
        # expect(page).to have_content('01:43')
    end
end

RSpec.describe 'Delete Admin Requests', type: :feature do
    scenario 'Delete' do
        visit new_admin_request_path
        click_on 'Sign Up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'Create Account'

        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'
        visit admin_requests_path
        click_on 'Destroy'
    
        visit admin_requests_path
        expect(page).not_to have_content('REQUESTED')
        expect(page).not_to have_content('new officer: test')
    end
end


# Test to make sure ranking page renders on page
RSpec.describe 'Show Ranking', type: :feature do
  scenario 'show' do 
    
    visit rankings_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'
    visit rankings_path
    
    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')

  end
end

# Test to create ranking
RSpec.describe 'Create Ranking', type: :feature do
  scenario 'valid inputs' do 
    
    visit rankings_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'
    visit rankings_path

    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')
    expect(page).to have_content('150')
    expect(page).to have_content('test ranking')
  
  end
end

# Test to update ranking
RSpec.describe 'Create Ranking', type: :feature do
  scenario 'valid inputs' do 
    
    visit rankings_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'
    
    visit rankings_path
    click_on 'Edit'
    fill_in 'Title', with: 'test ranking 1'
    fill_in 'Point total', with: '50'
    click_on 'Update Ranking'
    visit rankings_path

    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')
    expect(page).to have_content('50')
    expect(page).to have_content('test ranking 1')
  
  end
end

# Test to update ranking
RSpec.describe 'Create Ranking', type: :feature do
  scenario 'valid inputs' do 
    
    visit rankings_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_on 'Create Account'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'
    
    visit rankings_path
    click_on 'Destroy'
    
    expect(page).not_to have_content('150')
    expect(page).not_to have_content('test ranking')
  
  end
 end
