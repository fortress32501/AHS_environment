# frozen_string_literal: true

require 'rails_helper'

module SpecTestHelper
  def login_user
    user = FactoryGirl.create(:user)
    request.session[:user_id] = user.id
  end
end

RSpec.configure do |config|
  config.include SpecTestHelper, type: :controller
end
