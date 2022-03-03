module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :base_mutation, mutation: Mutations::BaseMutation
  end
end
