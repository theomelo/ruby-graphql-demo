require 'test_helper'

module Mutations
  class CreateLinkTest < ActiveSupport::TestCase

    def perform(user: nil, **kwargs)
      CreateLink.new(object: nil, field: nil, context: {}).resolve(**kwargs)
    end

    test 'create a new link' do
      link = perform(
        url: 'http://example.com',
        description: 'description'
      )

      assert link.persisted?
      assert_equal link.description, 'description'
      assert_equal link.url, 'http://example.com'
    end
  end
end
