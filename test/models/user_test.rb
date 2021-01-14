# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
  end

  test 'user with an email, password and name should be valid' do
    assert @user.valid?
  end

  test 'user should not be valid without name' do
    @user.name = nil
    refute @user.valid?
  end

  test 'user should not be valid without email' do
    @user.email = nil
    refute @user.valid?
  end

  test 'user should not be valid with an invalid email format' do
    @user.email = 'batman-gmail.com'
    refute @user.valid?
  end

  test 'user should not be valid with a password lower than 6 characters' do
    @user.password = 'Test'
    refute @user.valid?
  end
end
