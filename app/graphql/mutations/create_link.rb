module Mutations
  class CreateLink < BaseMutation
    argument :url, String, required: true
    argument :description, String, required: true

    #type Types::LinkType

    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false

    def resolve(url: nil, description: nil)
      Link.create!(
        url: url,
        description: description,
      )
    end
  end
end
