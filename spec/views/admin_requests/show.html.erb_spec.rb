require 'rails_helper'

RSpec.describe "admin_requests/show", type: :view do
  before(:each) do
    @test_user = assign(:user, User.create!(
        first_name: Faker::Name.name,
        last_name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        point: 0,
        is_admin: false,
    ))

    @admin_request = assign(:admin_request, AdminRequest.create!(
      user_id: @test_user.id,
      request_status: "Request Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Request Status/)
  end
end
