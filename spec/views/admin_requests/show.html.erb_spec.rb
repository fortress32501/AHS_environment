require 'rails_helper'

RSpec.describe "admin_requests/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
        id: 2,
        first_name: "testUser",
        last_name: "1",
        email: "testUser1@email.com",
        password: "testUser1!Hello",
        point: 0,
        is_admin: false
    ))

    @admin_request = assign(:admin_request, AdminRequest.create!(
      user_id: 2,
      request_status: "Request Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Request Status/)
  end
end
