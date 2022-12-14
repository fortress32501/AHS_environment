# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin_requests/index', type: :view do
  before(:each) do
    @test_user1 = assign(:user, User.create!(
                                  first_name: Faker::Name.name,
                                  last_name: Faker::Name.name,
                                  email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  point: 0,
                                  is_admin: true
                                ))

    @test_user2 = assign(:user, User.create!(
                                  first_name: Faker::Name.name,
                                  last_name: Faker::Name.name,
                                  email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  point: 0,
                                  is_admin: false
                                ))

    @test_user3 = assign(:user, User.create!(
                                  first_name: Faker::Name.name,
                                  last_name: Faker::Name.name,
                                  email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  point: 0,
                                  is_admin: false
                                ))

    assign(:admin_requests, [
             AdminRequest.create!(
               user_id: @test_user2.id,
               request_status: 'REQUESTED',
               request_reason: 'new treasurer'
             ),
             AdminRequest.create!(
               user_id: @test_user3.id,
               request_status: 'REQUESTED',
               request_reason: 'new officer in da org'
             )
           ])

    # set the user that's signed in
    assign(:current_user, @test_user1)
  end

  it 'renders a list of admin_requests for admin to review' do
    render
    # user id's for request
    assert_select 'tr>td', text: @test_user3.first_name.to_s + " " + @test_user3.last_name.to_s, count: 1
    assert_select 'tr>td', text: @test_user2.first_name.to_s + " " + @test_user2.last_name.to_s, count: 1
    # request status'
    assert_select 'tr>td', text: 'REQUESTED'.to_s, count: 2
    # request reasons
    assert_select 'tr>td', text: 'new treasurer'.to_s, count: 1
    assert_select 'tr>td', text: 'new officer in da org'.to_s, count: 1
  end
end
