require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      event_points: 1,
      event_description: "MyString",
      event_passcode: "MyString",
      event_title: "MyString",
      event_location: "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[event_points]"

      assert_select "input[name=?]", "event[event_description]"

      assert_select "input[name=?]", "event[event_passcode]"

      assert_select "input[name=?]", "event[event_title]"

      assert_select "input[name=?]", "event[event_location]"
    end
  end
end
