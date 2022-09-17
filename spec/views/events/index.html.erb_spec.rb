require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        event_points: 2,
        event_description: "Event Description",
        event_passcode: "Event Passcode",
        event_title: "Event Title",
        event_location: "Event Location"
      ),
      Event.create!(
        event_points: 2,
        event_description: "Event Description",
        event_passcode: "Event Passcode",
        event_title: "Event Title",
        event_location: "Event Location"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Event Description".to_s, count: 2
    assert_select "tr>td", text: "Event Passcode".to_s, count: 2
    assert_select "tr>td", text: "Event Title".to_s, count: 2
    assert_select "tr>td", text: "Event Location".to_s, count: 2
  end
end
