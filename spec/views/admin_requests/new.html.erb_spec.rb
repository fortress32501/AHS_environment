require 'rails_helper'

RSpec.describe "admin_requests/new", type: :view do
  before(:each) do
    assign(:admin_request, AdminRequest.new(
      user_id: 1,
      request_status: "REQUESTED"
    ))
  end

  it "renders new admin_request form" do
    render

    assert_select "form[action=?][method=?]", admin_requests_path, "post" do

      assert_select "input[name=?]", "admin_request[user_id]"

      assert_select "input[name=?]", "admin_request[request_status]"
    end
  end
end
