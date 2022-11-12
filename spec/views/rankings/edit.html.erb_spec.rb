# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rankings/edit', type: :view do
  before(:each) do
    @ranking = assign(:ranking, Ranking.create!(
                                  title: 'MyString',
                                  point_total: 1
                                ))
  end

  it 'renders the edit ranking form' do
    render

    assert_select 'form[action=?][method=?]', ranking_path(@ranking), 'post' do
      assert_select 'input[name=?]', 'ranking[title]'

      assert_select 'input[name=?]', 'ranking[point_total]'
    end
  end
end
