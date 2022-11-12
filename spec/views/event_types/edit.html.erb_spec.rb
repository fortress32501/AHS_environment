# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'event_types/edit', type: :view do
  before(:each) do
    @event_type = assign(:event_type, EventType.create!(
                                        type_name: 'MyString',
                                        description: 'MyString',
                                        color: 'MyString'
                                      ))
  end

  it 'renders the edit event_type form' do
    render

    assert_select 'form[action=?][method=?]', event_type_path(@event_type), 'post' do
      assert_select 'input[name=?]', 'event_type[type_name]'

      assert_select 'input[name=?]', 'event_type[description]'

      assert_select 'input[name=?]', 'event_type[color]'
    end
  end
end
