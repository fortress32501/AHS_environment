#require 'rails_helper'

#RSpec.describe "attendances/edit", type: :view do
#  before(:each) do
#    @attendance = assign(:attendance, Attendance.create!(
#      user_id: 1,
#      event_id: 1,
#      points: 1
#    ))
#  end

#  it "renders the edit attendance form" do
#    render

#    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

#      assert_select "input[name=?]", "attendance[user_id]"

#      assert_select "input[name=?]", "attendance[event_id]"

#      assert_select "input[name=?]", "attendance[points]"
#    end
#  end
#end
