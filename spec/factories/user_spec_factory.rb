# frozen_string_literal: true

FactoryGirl.define do
  factory :user, class: User do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    point { 0 }
    is_admin { false }
  end
end
