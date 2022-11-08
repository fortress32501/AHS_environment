# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Sign Up/ Login Integration Test
RSpec.describe 'Creating a User', type: :feature do
    scenario 'valid inputs' do  
      # Test Sign Up
      visit new_user_path
      fill_in 'First name', with: 'Jane'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Email', with: 'jane@gmail.com'
      fill_in 'Password', with: '123'
      click_on 'submit'
      expect(page).to have_content('Welcome')
      click_on 'account'
      click_on 'Sign Out'
      
      # Test Login
      fill_in 'Email', with: 'jane@gmail.com'
      fill_in 'Password', with: '123'
      click_on 'sign in'
      expect(page).to have_content('Welcome')
    end
  end
  
  # Show user 
RSpec.describe 'Show user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'submit'  
    visit accounts_path
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
    click_on 'submit'  
    visit accounts_path
    click_on 'Edit Profile'
    fill_in 'First name', with: 'Doe'
    fill_in 'Last name', with: 'John'
    fill_in 'Email', with: 'john@gmail.com'
    click_on 'Update'  
    visit accounts_path
    expect(page).to have_content('John')
    expect(page).to have_content('Doe')
    expect(page).not_to have_content('Jane')
  end
end


# Delete user 
RSpec.describe 'Delete user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '123'
    click_on 'submit'
    visit accounts_path
    click_on 'Delete Account'
    expect(page).not_to have_content('Jane')
    expect(page).not_to have_content('jane@gmail.com')
  end
end


#Edit user points
RSpec.describe 'Edit user points', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb" 
  end
  scenario 'valid inputs' do
    visit new_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'
    visit users_path
    click_on 'Edit'
    fill_in 'Point', with: 3
    click_on 'Update User'
    expect(page).to have_content(3)
  end
end


#points should not chnage if not edited
RSpec.describe 'Do not edit user points', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb" 
  end
  scenario 'valid inputs' do
    visit new_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'
    visit users_path
    click_on 'Edit'
    fill_in 'Point', with: 3
    click_on 'Update User'
    click_on 'Edit'
    click_on 'Cancel'
    expect(page).to have_content(3)
  end
end
  
  
  #points should not chnage if not edited
  RSpec.describe 'Do not edit user points', type: :feature do
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end
    scenario 'valid inputs' do
      visit new_event_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'Test'
      click_on 'sign in'
      visit users_path
      click_on 'Edit'
      fill_in 'Point', with: 3
      click_on 'Update User'
      click_on 'Edit'
      click_on 'Cancel'
      expect(page).to have_content(3)
    end
  end

  RSpec.describe 'User viewable point testing', type: :feature do
    before(:each) do
      load "#{Rails.root}/db/seeds_test.rb" 
    end 
    scenario 'valid inputs' do
      visit new_event_type_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'Test'
      click_on 'sign in'
      
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
      
      click_on 'account'
      click_on 'Sign out'
  
      click_on 'sign up'
      fill_in 'First name', with: 'test'
      fill_in 'Last name', with: 'test'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'test'
      click_on 'submit'
  
      click_on 'Events'
      visit new_attendance_path(1)
      # Create attendance
      #click_on 'Sign In For Event'
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