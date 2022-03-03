# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    description 'A blog post'
    field :id, ID, null: false
    field :title, String
    field :truncated_preview, String, null: false
    field :rating, Integer
    field :comments, [Types::CommentType],
      description: "This post's comments, or null if comments are disabled."
  end
end
