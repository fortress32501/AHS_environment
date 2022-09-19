# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Event', type: :feature do
    scenario 'valid inputs' do
        visit new_event_path
        fill_in 'title', with: '1st Meeting'
        fill_in 'Event_description', with: 'General Meeting'
        fill_in 'Event_points', with: '5'
        fill_in 'Event_passcode', with: 'Test'
        fill_in 'Event_location', with: 'ZACH'
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
        click_on 'Destroy'
    
        visit new_event_path
        expect(page).not_to have_content('1st Meeting')
        expect(page).not_to have_content('General Meeting')

    end
end

RSpec.describe 'Edit Events', type: :feature do
    scenario 'Change book name' do
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
        fill_in 'first_name', with: 'Jane'
        fill_in 'last_name', with: 'Doe'
        fill_in 'email', with: 'jane@gmail.com'
        fill_in 'password', with: '123'
        click_on 'Create Account'
        expect(page).to have_content('jane@gmail.com')
        click_on 'Sign out'

        # Test Login
        fill_in 'email', with: 'jane@gmail.com'
        fill_in 'password', with: '123'
        click_on 'Sign In!'
        expect(page).to have_content('jane@gmail.com')
    end
end




