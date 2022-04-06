module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :folders, [Types::FolderType], null: false
    def folders
      Folder.limit(100).all
    end

    field :folder, Types::FolderType, null: false do
      argument :id, ID, required: true
    end
    def folder(id:)
      Folder.find(id)
    end
  end
end
