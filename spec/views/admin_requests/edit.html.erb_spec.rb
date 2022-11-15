# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin_requests/edit', type: :view do
  before(:each) do
    @test_user1 = assign(:user, User.create!(
                                  first_name: Faker::Name.name,
                                  last_name: Faker::Name.name,
                                  email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  point: 0,
                                  is_admin: false
                                ))

    @admin_request = assign(:admin_request, AdminRequest.create!(
                                              user_id: @test_user1.id,
                                              request_status: 'REQUESTED',
                                              request_reason: 'i am the new president'
                                            ))

    assign(:current_user, @test_user1)
  end

  it 'renders the edit admin_request form' do
    render

    assert_select 'form[action=?][method=?]', admin_request_path(@admin_request), 'post' do
      assert_select 'input[name=?]', 'admin_request[user_id]'

      assert_select 'input[name=?]', 'admin_request[request_status]'
    end
  end
end
