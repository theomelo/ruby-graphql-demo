require 'test_helper'

module Mutations
  class SignInUserTest < ActiveSupport::TestCase

    def perform(**kwargs)
      SignInUser.new(object: nil, field: nil, context: { session: {}}).resolve(**kwargs)
    end

    def create_user
      ::User.create!(
        name: 'Test User',
        email: 'email@example.com',
        password: '[omitted]'
      )
    end

    test 'success' do
      user = create_user

      result = perform(
        credentials: {
          email: user.email,
          password: user.password
        }
      )

      assert result[:token].present?
      assert_equal result[:user], user
    end

    test 'fails because no credentials were given' do
      assert_nil perform
    end

    test 'fails because of wrong email' do
      create_user
      assert_nil perform(credentials: { email: 'nope' })
    end

    test 'fails because of wrong password' do
      create_user
      assert_nil perform(credentials: { password: 'nope' })
    end
  end
end
