# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Integration test for creating an event type
RSpec.describe 'Creating an EventType', type: :feature do
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
      scenario 'valid inputs' do
          visit new_event_type_path
          
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'Password', with: 'Test'
          click_on 'Sign In'
   
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
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
      scenario 'valid inputs' do
          visit new_event_type_path
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'Password', with: 'Test'
          click_on 'Sign In'
   
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
    before(:each) do
        load "#{Rails.root}/db/seeds_test.rb" 
    end
    scenario 'delete' do
        visit new_event_type_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'Test'
        click_on 'Sign In'
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
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
      scenario 'update' do
          visit new_event_type_path
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'Password', with: 'Test'
          click_on 'Sign In'
   
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
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
      scenario 'valid inputs' do
          visit new_event_type_path
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'Password', with: 'Test'
          click_on 'Sign In'
          
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
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
      scenario 'valid inputs' do
          visit new_event_type_path
          fill_in 'Email', with: 'test@gmail.com'
          fill_in 'Password', with: 'Test'
          click_on 'Sign In'
          
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
  