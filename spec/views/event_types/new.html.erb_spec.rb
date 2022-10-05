require 'rails_helper'

RSpec.describe "event_types/new", type: :view do
  before(:each) do
    assign(:event_type, EventType.new(
      type_name: "MyString",
      description: "MyString",
      color: "MyString"
    ))
  end

  it "renders new event_type form" do
    render

    assert_select "form[action=?][method=?]", event_types_path, "post" do

      assert_select "input[name=?]", "event_type[type_name]"

      assert_select "input[name=?]", "event_type[description]"

      assert_select "input[name=?]", "event_type[color]"
    end
  end
end
