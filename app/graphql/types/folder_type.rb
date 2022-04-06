module Types
  class FolderType < Types::BaseObject
    graphql_name "Folder"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :data_url, String, null: false
    field :name, String, null: false
    def name
      object.formatted_name
    end
  end
end
