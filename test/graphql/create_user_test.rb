require 'test_helper'

module Mutations
  class CreateUserTest < ActiveSupport::TestCase
    def perform(**kwargs)
      CreateUser.new(object: nil, field: nil, context: {}).resolve(**kwargs)
    end

    test 'create new user' do
      user = perform(
        name: 'Test User',
        auth_provider: {
          credentials: {
            email: 'email@example.com',
            password: '[omitted]'
          }
        }
      )

      assert user.persisted?
      assert_equal user.name, 'Test User'
      assert_equal user.email, 'email@example.com'
    end
  end
end
