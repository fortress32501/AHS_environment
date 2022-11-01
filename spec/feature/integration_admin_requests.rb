# location: spec/feature/integration_spec.rb
require 'rails_helper'

# destroy is just a redirection so it's testing should be handled in the controller (requests)

RSpec.describe 'Creating an Admin Request', type: :feature do
    # should be able to create an admin request
    scenario 'valid inputs' do
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'
 
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
end


RSpec.describe 'Edit Admin Requests', type: :feature do
    # should be able to edit your own admin_requests
    scenario 'Edit' do
        # create account
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'

        # create admin_request
        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'
        visit admin_requests_path

        # edit request info
        click_on 'Edit'
        fill_in 'Request reason', with: 'new officer: treasurer position'
        click_on 'Update Admin request'
        visit admin_requests_path

        # make sure it renders new reason
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: treasurer position')
    end
end

RSpec.describe 'Review Admin Requests', type: :feature do
    before(:each) do
        @email = Faker::Internet.email
        @password = Faker::Internet.email
        @test_admin = User.create!(
          first_name: Faker::Name.name,
          last_name: Faker::Name.name,
          email: @email,
          password: @password,
          point: 0,
          is_admin: true,
        )
    end

    # admin should be able to approve the request
    scenario 'Approve' do
        # create a new user account
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'

        # create admin request from user
        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'

        # sign out of regular user
        click_on 'account'
        click_on 'Sign out'
        
        # sign in as admin user
        fill_in 'Email Address', with: @email
        fill_in 'Password', with: @password
        click_on 'sign in'

        # check to make sure the request can be reviewed
        # having problem with the Review link displaying
            # currently not able to find it
            # might be something to do with "current_user"
        visit admin_requests_path
        expect(page).to have_content('Review')
        click_on 'Review'
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')

        # approve request
        click_on 'Approve'

        visit admin_requests_path 
        expect(page).to have_content('APPROVED')
        expect(page).to have_content('new officer: test')
    end

    # admin should be able to approve the request
    scenario 'Deny' do
        # create a new user account
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'

        # create admin request from user
        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'

        # sign out of regular user
        click_on 'account'
        click_on 'Sign out'
        
        # sign in as admin user
        fill_in 'Email Address', with: @email
        fill_in 'Password', with: @password
        click_on 'sign in'

        # check to make sure the request can be reviewed
        # having problem with the Review link displaying
            # currently not able to find it
            # might be something to do with "current_user"
        visit admin_requests_path
        expect(page).to have_content('Review')
        click_on 'Review'
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')

        # approve request
        click_on 'Deny'

        visit admin_requests_path 
        expect(page).to have_content('DENIED')
        expect(page).to have_content('new officer: test')
    end

    # admin should be able to review request and take no action on request
    scenario 'No Action' do
        # create a new user account
        visit new_admin_request_path
        click_on 'sign up'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'test'
        click_on 'submit'

        # create admin request from user
        visit new_admin_request_path
        fill_in 'Request reason', with: 'new officer: test'
        click_on 'Create Admin request'

        # sign out of regular user
        click_on 'account'
        click_on 'Sign out'
        
        # sign in as admin user
        fill_in 'Email Address', with: @email
        fill_in 'Password', with: @password
        click_on 'sign in'

        # check to make sure the request can be reviewed
        # having problem with the Review link displaying
            # currently not able to find it
            # might be something to do with "current_user"
        visit admin_requests_path
        expect(page).to have_content('Review')
        click_on 'Review'
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')

        # approve request
        click_on 'Back'

        visit admin_requests_path 
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
    end
end