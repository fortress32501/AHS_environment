require 'rails_helper'

RSpec.describe "rankings/new", type: :view do
  before(:each) do
    assign(:ranking, Ranking.new(
      title: "MyString",
      point_total: 1
    ))
  end

  it "renders new ranking form" do
    render

    assert_select "form[action=?][method=?]", rankings_path, "post" do

      assert_select "input[name=?]", "ranking[title]"

      assert_select "input[name=?]", "ranking[point_total]"
    end
  end
end
