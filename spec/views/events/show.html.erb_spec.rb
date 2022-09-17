require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      event_points: 2,
      event_description: "Event Description",
      event_passcode: "Event Passcode",
      event_title: "Event Title",
      event_location: "Event Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Event Description/)
    expect(rendered).to match(/Event Passcode/)
    expect(rendered).to match(/Event Title/)
    expect(rendered).to match(/Event Location/)
  end
end
