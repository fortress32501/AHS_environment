require 'rails_helper'

RSpec.describe "admin_requests/new", type: :view do
  before(:each) do
    assign(:admin_request, AdminRequest.new(
      user_id: 1,
      request_status: "REQUESTED",
      request_reason: "i am a new officer in the organization"
    ))
  end

  it "renders new admin_request form" do
    # "current_user" is used in the form to pass the id into the controller
    # need to figure out how to set current_user in the test_case 
    # render

    # assert_select "form[action=?][method=?]", admin_requests_path, "post" do

    #   assert_select "input[name=?]", "admin_request[user_id]"

    #   assert_select "input[name=?]", "admin_request[request_status]"
    # end
  end
end
