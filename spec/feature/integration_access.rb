# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Routes Access', type: :feature do 
      scenario 'valid inputs' do
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test1'
        fill_in 'Last name', with: 'test2'
        fill_in 'Email', with: 'test@test.com'
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
  end