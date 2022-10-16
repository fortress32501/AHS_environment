require 'rails_helper'

RSpec.describe "admin_requests/index", type: :view do
  before(:each) do
    @test_user1 = assign(:user, User.create!(
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        point: 0,
        is_admin: false,
    ))

    @test_user2 = assign(:user, User.create!(
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        point: 0,
        is_admin: false,
    ))

    assign(:admin_requests, [
      AdminRequest.create!(
        user_id: @test_user1.id,
        request_status: "REQUESTED"
      ),
      AdminRequest.create!(
        user_id: @test_user2.id,
        request_status: "APPROVED"
      )
    ])
  end

  it "renders a list of admin_requests" do
    render
    # user id's for request
    assert_select "tr>td", text: @test_user1.id.to_s, count: 1
    assert_select "tr>td", text: @test_user2.id.to_s, count: 1
    # request status'
    assert_select "tr>td", text: "REQUESTED".to_s, count: 1
    assert_select "tr>td", text: "APPROVED".to_s, count: 1
  end
end
