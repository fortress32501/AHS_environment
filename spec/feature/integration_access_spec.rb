# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Routes Access', type: :feature do     
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end  
    scenario 'valid inputs' do
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test1'
        fill_in 'Last name', with: 'test2'
        fill_in 'Email', with: 'test1@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'
        
        visit attendances_path
        expect(page).to have_current_path(events_path)
        
        visit new_event_type_path
        expect(page).to have_current_path(event_types_path)

        visit new_event_path
        expect(page).to have_current_path(events_path)

        visit rankings_path
        expect(page).to have_current_path(events_path)

        visit new_ranking_path
        expect(page).to have_current_path(events_path)

        visit users_path
        expect(page).to have_content('test1')
        expect(page).to have_content('test2')

    end

    scenario 'valid inputs events access' do
        visit new_session_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'Test'
        click_on 'sign in'

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

        visit new_event_type_path
        fill_in 'Type name', with: 'type1'
        fill_in 'Description', with: 'General Meeting'
        click_on 'Create Event type'

        visit new_ranking_path
        fill_in 'Title', with: 'test ranking'
        fill_in 'Point total', with: '150'
        click_on 'Create Ranking'

        visit events_path
        click_on 'Show'
        click_on 'Sign In For Event'
        
        fill_in 'Password', with: 'Test'
        click_on 'Create Attendance'

        visit rankings_path
        expect(page).to have_content('test ranking')
        expect(page).to have_content('150')
        expect(page).to have_content('test@gmail.com')
        expect(page).to have_content('5')

        visit accounts_path
        expect(page).to have_content('1st Meeting')
        expect(page).to have_content('test@gmail.com')

      end
  end