require 'rails_helper'

RSpec.describe "admin_requests/index", type: :view do
  before(:each) do
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
