# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.unique.email(name: 'batman') }
    password { Faker::Internet.password(min_length: 8) }
  end
end
