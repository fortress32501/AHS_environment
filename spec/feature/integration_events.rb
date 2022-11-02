# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating an Event', type: :feature) do
  before do
    load "#{Rails.root}/db/seeds_test.rb"
  end

  it 'valid inputs' do
    visit new_event_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'Sign In'

    visit new_event_path
    fill_in 'title', with: '1st Meeting'
    fill_in 'description', with: 'General Meeting'
    fill_in 'points', with: '5'
    fill_in 'passcode', with: 'Test'
    fill_in 'location', with: 'ZACH'
    select '2020', from: 'event_event_start_1i'
    select 'September', from: 'event_event_start_2i'
    select '28', from: 'event_event_start_3i'
    select '01', from: 'event_event_start_4i'
    select '43', from: 'event_event_start_5i'
    select '2020', from: 'event_event_end_1i'
    select 'September', from: 'event_event_end_2i'
    select '28', from: 'event_event_end_3i'
    select '02', from: 'event_event_end_4i'
    select '43', from: 'event_event_end_5i'
    click_on 'Create Event'
    visit events_path
    expect(page).to(have_content('1st Meeting'))
    expect(page).to(have_content('General Meeting'))
    expect(page).to(have_content('5'))
    expect(page).to(have_content('Test'))
    expect(page).to(have_content('2020-09-28'))
    expect(page).to(have_content('01:43'))
  end
end

# RSpec.describe('Show Events', type: :feature) do
#   before do
#     load "#{Rails.root}/db/seeds_test.rb"
#   end

#   it 'Show' do
#     visit new_event_path
#     fill_in 'Email', with: 'test@gmail.com'
#     fill_in 'Password', with: 'Test'
#     click_on 'Sign In'
#     visit new_event_path
#     fill_in 'title', with: '1st Meeting'
#     fill_in 'description', with: 'General Meeting'
#     fill_in 'points', with: '5'
#     fill_in 'passcode', with: 'Test'
#     fill_in 'location', with: 'ZACH'
#     select '2020', from: 'event_event_start_1i'
#     select 'September', from: 'event_event_start_2i'
#     select '28', from: 'event_event_start_3i'
#     select '01', from: 'event_event_start_4i'
#     select '43', from: 'event_event_start_5i'
#     select '2020', from: 'event_event_end_1i'
#     select 'September', from: 'event_event_end_2i'
#     select '28', from: 'event_event_end_3i'
#     select '02', from: 'event_event_end_4i'
#     select '43', from: 'event_event_end_5i'
#     click_on 'Create Event'
#     visit events_path
#     click_on 'Show'
#     expect(page).to(have_content('1st Meeting'))
#     expect(page).to(have_content('General Meeting'))
#     expect(page).to(have_content('2020-09-28'))
#     expect(page).to(have_content('01:43'))
#     expect(page).to(have_content('5'))
#     expect(page).to(have_content('Test'))
#   end
# end

# RSpec.describe('Delete Events', type: :feature) do
#   before do
#     load "#{Rails.root}/db/seeds_test.rb"
#   end

#   it 'Delete' do
#     new_sessions_path
#     fill_in 'Email', with: 'test@gmail.com'
#     fill_in 'Password', with: 'Test'
#     click_on 'sign in'
#     visit new_event_path
#     fill_in 'title', with: '1st Meeting'
#     fill_in 'description', with: 'General Meeting'
#     fill_in 'points', with: '5'
#     fill_in 'passcode', with: 'Test'
#     fill_in 'location', with: 'ZACH'
#     select '2020', from: 'event_event_start_1i'
#     select 'September', from: 'event_event_start_2i'
#     select '28', from: 'event_event_start_3i'
#     select '01', from: 'event_event_start_4i'
#     select '43', from: 'event_event_start_5i'
#     select '2020', from: 'event_event_end_1i'
#     select 'September', from: 'event_event_end_2i'
#     select '28', from: 'event_event_end_3i'
#     select '02', from: 'event_event_end_4i'
#     select '43', from: 'event_event_end_5i'
#     click_on 'Create Event'
#     visit events_path
#     click_on 'Destroy'

#     visit new_event_path
#     expect(page).not_to(have_content('1st Meeting'))
#     expect(page).not_to(have_content('General Meeting'))
#   end
# end

# RSpec.describe('Edit Events', type: :feature) do
#   before do
#     load "#{Rails.root}/db/seeds_test.rb"
#   end

#   it 'Edit' do
#     new_sessions_path
#     fill_in 'Email', with: 'test@gmail.com'
#     fill_in 'Password', with: 'Test'
#     click_on 'Sign In'

#     visit new_event_path
#     fill_in 'Event title', with: '1st Meeting'
#     fill_in 'Event description', with: 'General Meeting'
#     fill_in 'Event points', with: '5'
#     fill_in 'Event passcode', with: 'Test'
#     fill_in 'Event location', with: 'ZACH'
#     select '2020', from: 'event_event_start_1i'
#     select 'September', from: 'event_event_start_2i'
#     select '28', from: 'event_event_start_3i'
#     select '01', from: 'event_event_start_4i'
#     select '43', from: 'event_event_start_5i'
#     select '2020', from: 'event_event_end_1i'
#     select 'September', from: 'event_event_end_2i'
#     select '28', from: 'event_event_end_3i'
#     select '02', from: 'event_event_end_4i'
#     select '43', from: 'event_event_end_5i'
#     click_on 'Create Event'
#     visit events_path
#     click_on 'Edit'
#     fill_in 'Event title', with: '2nd Meeting'
#     click_on 'Update Event'
#     visit events_path
#     expect(page).to(have_content('2nd Meeting'))
#     expect(page).not_to(have_content('1st Meeting'))
#   end
# end

# # Test to make sure calendar renders on page
# RSpec.describe('Confirm Calendar', type: :feature) do
#   it 'Calendar' do
#     new_sessions_path
#     click_on 'Sign Up'
#     fill_in 'First name', with: 'test'
#     fill_in 'Last name', with: 'test'
#     fill_in 'Email', with: 'test@test.com'
#     fill_in 'Password', with: 'test'
#     click_on 'Create Account'
#     visit events_path

#     expect(page).to(have_content(Date.today.strftime('%B')))
#     expect(page).to(have_content('Sun'))
#     expect(page).to(have_content('Mon'))
#     expect(page).to(have_content('Tue'))
#     expect(page).to(have_content('Wed'))
#     expect(page).to(have_content('Thu'))
#     expect(page).to(have_content('Fri'))
#     expect(page).to(have_content('Sat'))
#   end
# end

# RSpec.describe('Event Point Testing', type: :feature) do
#   before do
#     load "#{Rails.root}/db/seeds_test.rb"
#   end

#   it 'valid inputs' do
#     # Signup
#     visit new_sessions_path
#     fill_in 'Email', with: 'test@gmail.com'
#     fill_in 'Password', with: 'Test'
#     click_on 'Sign In'

#     # Create event
#     click_on 'Events'
#     click_on 'New Event'
#     fill_in 'title', with: '1st Meeting'
#     fill_in 'description', with: 'General Meeting'
#     fill_in 'points', with: '5'
#     fill_in 'passcode', with: 'Test'
#     fill_in 'location', with: 'ZACH'
#     select '2022', from: 'event_event_start_1i'
#     select 'September', from: 'event_event_start_2i'
#     select '28', from: 'event_event_start_3i'
#     select '01', from: 'event_event_start_4i'
#     select '43', from: 'event_event_start_5i'
#     select Date.today.year, from: 'event_event_end_1i' # year
#     select Date::MONTHNAMES[Date.today.month], from: 'event_event_end_2i' # month
#     select Date.today.day, from: 'event_event_end_3i' # date
#     select '02', from: 'event_event_end_4i'
#     select '43', from: 'event_event_end_5i'
#     click_on 'Create Event'
#     # Test hidden event point and edit link
#     click_on 'Back'
#     click_on '1st Meeting', match: :first
#     expect(page).to(have_content('Event points'))
#     expect(page).to(have_content('Edit'))
#   end
# end

# RSpec.describe('Attendance Testing', type: :feature) do
#   before do
#     load "#{Rails.root}/db/seeds_test.rb"
#   end

#   it 'valid inputs' do
#     visit events_path
#     fill_in 'Email', with: 'test@gmail.com'
#     fill_in 'Password', with: 'Test'
#     click_on 'Sign In'

#     visit new_event_path
#     fill_in 'title', with: '1st Meeting'
#     fill_in 'description', with: 'General Meeting'
#     fill_in 'points', with: '5'
#     fill_in 'passcode', with: 'Test'
#     fill_in 'location', with: 'ZACH'
#     select '2020', from: 'event_event_start_1i'
#     select 'September', from: 'event_event_start_2i'
#     select '28', from: 'event_event_start_3i'
#     select '01', from: 'event_event_start_4i'
#     select '43', from: 'event_event_start_5i'
#     select '2020', from: 'event_event_end_1i'
#     select 'September', from: 'event_event_end_2i'
#     select '28', from: 'event_event_end_3i'
#     select '02', from: 'event_event_end_4i'
#     select '43', from: 'event_event_end_5i'
#     click_on 'Create Event'
#     # prep completed test sign in to event
#     click_on 'Sign In For Event'
#     fill_in 'attendance_password', with: 'Test'
#     select '1st Meeting', from: 'attendance_event_id'

#     click_on 'Create Attendance'
#     expect(page).to(have_content('Attendance was successfully created'))
#     expect(page).to(have_content('Test Test'))
#     expect(page).to(have_content('1st Meeting'))
#     expect(page).to(have_content('5'))
#     # test show page
#     click_on 'Back'
#     expect(page).to(have_content('Events'))

#     # Now test Event Password must be correct
#     visit new_attendance_path
#     fill_in 'attendance_password', with: 'fgf'
#     select '1st Meeting', from: 'attendance_event_id'
#     click_on 'Create Attendance'
#     expect(page).not_to(have_content('Attendance was successfully created'))
#     # Now test attendnace already exists
#     visit new_attendance_path
#     fill_in 'attendance_password', with: 'Test'
#     expect(page).not_to(have_content('Attendance was successfully created'))
#   end
# end
