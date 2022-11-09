# require 'rails_helper'

# RSpec.describe "rankings/index", type: :view do
#   before(:each) do
#     assign(:rankings, [
#       Ranking.create!(
#         title: "Title",
#         point_total: 2
#       ),
#       Ranking.create!(
#         title: "Title",
#         point_total: 2
#       )
#     ])
#     assign(:list_rankings, [
#       User.create!(
#         first_name: "First Name",
#         last_name: "Last Name",
#         email: "Email",
#         password_digest: "Password Digest",
#         point: 2,
#         is_admin: true
#       ),
#       User.create!(
#         first_name: "First Name",
#         last_name: "Last Name",
#         email: "Email",
#         password_digest: "Password Digest",
#         point: 2,
#         is_admin: true
#       )
#     ])
#   end

#   it "renders a list of rankings" do
#     render
#     assert_select "tr>td", text: "Title".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 4
#   end
# end
