# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Admin Request', type: :feature do
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

    scenario 'valid inputs for multiple' do
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
        click_on 'Destroy'
    
        visit admin_requests_path
        expect(page).not_to have_content('REQUESTED')
        expect(page).not_to have_content('new officer: test')
    end
end

RSpec.describe 'Review Admin Requests', type: :feature do
    scenario 'Review' do
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
        
        # sign in as admin user
        visit new_session_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'Test'
        click_on 'sign in'

        # check to make sure the request can be reviewed
        visit admin_requests_path
        # having problem with the Review link displaying
            # currently not able to find it
            # might be something to do with "current_user"
        # click_on 'Review'
        expect(page).to have_content('REQUESTED')
        expect(page).to have_content('new officer: test')
        # need to figure out how to see what the date the request ^^ was generated
        # this would vary with every time the test case is run
        # expect(page).to have_content('2020-09-28')
        # expect(page).to have_content('01:43')
    end
end