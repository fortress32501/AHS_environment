require 'rails_helper'

RSpec.describe "admin_requests/index", type: :view do
  before(:each) do
    @user2 = assign(:user, User.create!(
        id: 2,
        first_name: "testUser",
        last_name: "2",
        email: "testUser1@email.com",
        password: "testUser1!Hello",
        point: 0,
        is_admin: false
    ))

    @user3 = assign(:user, User.create!(
        id: 3,
        first_name: "testUser",
        last_name: "3",
        email: "testUser1@email.com",
        password: "testUser1!Hello",
        point: 0,
        is_admin: false
    ))

    assign(:admin_requests, [
      AdminRequest.create!(
        user_id: 2,
        request_status: "Request Status"
      ),
      AdminRequest.create!(
        user_id: 2,
        request_status: "Request Status"
      )
    ])
  end

  it "renders a list of admin_requests" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Request Status".to_s, count: 2
  end
end
