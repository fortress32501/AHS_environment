# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Test to make sure ranking page renders on page
RSpec.describe 'Show Ranking', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb"
  end
  scenario 'show' do
    visit new_event_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'
    visit rankings_path

    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')
  end
end

# Test to create ranking
RSpec.describe 'Create Ranking', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb"
  end
  scenario 'valid inputs' do
    visit rankings_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'
    visit rankings_path

    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')
    expect(page).to have_content('150')
    expect(page).to have_content('test ranking')
  end
end

# Test to update ranking
RSpec.describe 'Create Ranking', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb"
  end
  scenario 'valid inputs' do
    visit rankings_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'

    visit rankings_path
    click_on 'Edit'
    fill_in 'Title', with: 'test ranking 1'
    fill_in 'Point total', with: '50'
    click_on 'Update Ranking'
    visit rankings_path

    expect(page).to have_content('Rankings')
    expect(page).to have_content('New Ranking')
    expect(page).to have_content('Title')
    expect(page).to have_content('Point total')
    expect(page).to have_content('50')
    expect(page).to have_content('test ranking 1')
  end
end

# Test to update ranking
RSpec.describe 'Create Ranking', type: :feature do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb"
  end
  scenario 'valid inputs' do
    visit rankings_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'Test'
    click_on 'sign in'

    visit new_ranking_path
    fill_in 'Title', with: 'test ranking'
    fill_in 'Point total', with: '150'
    click_on 'Create Ranking'

    visit rankings_path
    click_on 'Destroy'

    expect(page).not_to have_content('150')
    expect(page).not_to have_content('test ranking')
  end
end
