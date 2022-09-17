require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      event_points: 1,
      event_description: "MyString",
      event_passcode: "MyString",
      event_title: "MyString",
      event_location: "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[event_points]"

      assert_select "input[name=?]", "event[event_description]"

      assert_select "input[name=?]", "event[event_passcode]"

      assert_select "input[name=?]", "event[event_title]"

      assert_select "input[name=?]", "event[event_location]"
    end
  end
end
