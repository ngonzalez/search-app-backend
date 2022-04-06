module Types
  class ImageType < Types::BaseObject
    graphql_name "Image"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :file_url, String, null: false
    field :thumb_url, String, null: false
    def file_url
      object.file.url
    end
    def thumb_url
      object.thumb.url
    end
  end
end
