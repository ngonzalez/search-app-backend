module Mutations
  class ShowItem < Mutations::BaseMutation
    graphql_name "showItem"

    argument :id, String, required: true

    field :folder, Types::FolderType, null: false
    field :audio_files, [Types::AudioFileType], null: false
    field :images, [Types::ImageType], null: false

    def resolve(args)
      folder = Folder.find_by data_url: args[:id]
      MutationResultPaginated.call(
        obj: {
          folder: folder,
          audio_files: folder.audio_files,
          images: folder.images,
        },
        loading: false,
        errors: [],
      )
    end
  end
end
