# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  before(:each) do
    assign(:event, Event.new(
                     event_points: 1,
                     event_description: 'MyString',
                     event_passcode: 'MyString',
                     event_title: 'MyString',
                     event_location: 'MyString',
                     event_start: DateTime.parse('2022-09-28T01:43:00+07:00'),
                     event_end: DateTime.parse('2022-09-28T02:43:00+07:00')
                   ))
  end

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input[name=?]', 'event[event_points]'

      assert_select 'input[name=?]', 'event[event_description]'

      assert_select 'input[name=?]', 'event[event_passcode]'

      assert_select 'input[name=?]', 'event[event_title]'

      assert_select 'input[name=?]', 'event[event_location]'

      assert_select 'select[name=?]', 'event[event_start(1i)]'

      assert_select 'select[name=?]', 'event[event_end(1i)]'

      assert_select 'select[name=?]', 'event[event_start(2i)]'

      assert_select 'select[name=?]', 'event[event_end(2i)]'

      assert_select 'select[name=?]', 'event[event_start(3i)]'

      assert_select 'select[name=?]', 'event[event_end(3i)]'

      assert_select 'select[name=?]', 'event[event_start(4i)]'

      assert_select 'select[name=?]', 'event[event_end(4i)]'

      assert_select 'select[name=?]', 'event[event_start(5i)]'

      assert_select 'select[name=?]', 'event[event_end(5i)]'
    end
  end
end
