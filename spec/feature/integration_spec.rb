# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Event', type: :feature do
    scenario 'valid inputs' do
        visit new_event_path
        fill_in 'Title', with: '1st Meeting'
        fill_in 'Section', with: 'General Meeting'
        # fill_in 'Schedule' , with: DateTime.current.strftime('2020-12-06-01-43')
        fill_in 'Points', with: '5'
        fill_in 'Passcode', with: 'Test'
        click_on 'Create Event'
        visit events_path
        expect(page).to have_content('1st Meeting')
        expect(page).to have_content('General Meeting')
        # expect(page).to have_content('2020-12-06')
        # expect(page).to have_content('1:43')
        expect(page).to have_content('5')
        expect(page).to have_content('Test')
    end
end


RSpec.describe 'Show Events', type: :feature do
    scenario 'Show' do
        visit new_event_path
        fill_in 'Title', with: '1st Meeting'
        fill_in 'Section', with: 'General Meeting'
        # fill_in 'Schedule' , with: DateTime.current.strftime('2020-12-06-01-43')
        fill_in 'Points', with: '5'
        fill_in 'Passcode', with: 'Test'
        click_on 'Create Event'
        visit events_path
        click_on 'Show'
        expect(page).to have_content('1st Meeting')
        expect(page).to have_content('General Meeting')
        # expect(page).to have_content('2020-12-06')
        # expect(page).to have_content('1:43')
        expect(page).to have_content('5')
        expect(page).to have_content('Test')
    end
end

RSpec.describe 'Delete Events', type: :feature do
    scenario 'Delete' do
        visit new_event_path
        fill_in 'Title', with: '1st Meeting'
        fill_in 'Section', with: 'General Meeting'
        # fill_in 'Schedule' , with: DateTime.current.strftime('2020-12-06-01-43')
        fill_in 'Points', with: '5'
        fill_in 'Passcode', with: 'Test'
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
        fill_in 'Title', with: '1st Meeting'
        fill_in 'Section', with: 'General Meeting'
        # fill_in 'Schedule' , with: DateTime.current.strftime('2020-12-06-01-43')
        fill_in 'Points', with: '5'
        fill_in 'Passcode', with: 'Test'
        click_on 'Create Event'
        visit events_path
        click_on 'Edit'
        fill_in 'Title', with: '2nd Meeting'
        click_on 'Update Event'
        visit events_path
        expect(page).to have_content('2nd Meeting')
        expect(page).not_to have_content('1st Meeting')
    end
end

