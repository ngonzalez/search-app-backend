module Types
  class AudioFileType < Types::BaseObject
    graphql_name "AudioFile"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :item_id, Integer, null: false
    field :data_url, String, null: false
    field :name, String, null: false

    def item_id
      object.id
    end
  end
end
