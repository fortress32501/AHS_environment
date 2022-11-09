# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rankings/show', type: :view do
  before(:each) do
    @ranking = assign(:ranking, Ranking.create!(
                                  title: 'Title',
                                  point_total: 2
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
  end
end
