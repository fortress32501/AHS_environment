require 'rails_helper'

RSpec.describe "admin_requests/edit", type: :view do
  before(:each) do
    @admin_request = assign(:admin_request, AdminRequest.create!(
      user_id: 1,
      request_status: "MyString"
    ))
  end

  it "renders the edit admin_request form" do
    render

    assert_select "form[action=?][method=?]", admin_request_path(@admin_request), "post" do

      assert_select "input[name=?]", "admin_request[user_id]"

      assert_select "input[name=?]", "admin_request[request_status]"
    end
  end
end