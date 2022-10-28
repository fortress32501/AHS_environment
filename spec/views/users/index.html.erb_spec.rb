# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('users/index', type: :view) do
  before do
    assign(:users, [
      User.create!(
        first_name: 'First Name',
        last_name: 'Last Name',
        email: 'Email',
        password_digest: 'Password Digest',
        point: 2,
        is_admin: false
      ),
      User.create!(
        first_name: 'First Name',
        last_name: 'Last Name',
        email: 'Email',
        password_digest: 'Password Digest',
        point: 2,
        is_admin: false
      )
    ]
    )
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    # assert_select "tr>td", text: "Password Digest".to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 0
  end
end

