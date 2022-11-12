# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin_requests/new', type: :view do
  before(:each) do
    @test_user1 = assign(:user, User.create!(
                                  first_name: Faker::Name.name,
                                  last_name: Faker::Name.name,
                                  email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  point: 0,
                                  is_admin: false
                                ))

    assign(:admin_request, AdminRequest.new(
                             user_id: @test_user1.id,
                             request_status: 'REQUESTED',
                             request_reason: 'i am a new officer in the organization'
                           ))

    # set the user that's signed in
    assign(:current_user, @test_user1)
  end

  it 'renders new admin_request form' do
    render

    assert_select 'form[action=?][method=?]', admin_requests_path, 'post' do
      assert_select 'input[name=?]', 'admin_request[user_id]'

      assert_select 'input[name=?]', 'admin_request[request_status]'

      assert_select 'input[name=?]', 'admin_request[request_reason]'
    end
  end
end
