module Mutations
  class Search < Mutations::BaseMutation
    graphql_name "Search"

    argument :q, String, required: true
    argument :page, Integer, required: true

    field :folders, [Types::FolderType], null: false
    field :current_page, Integer, null: false
    field :total_pages, Integer, null: false

    def resolve(args)
      folders = Folder.order("folder_created_at::timestamp DESC").search(args[:q])
      paginated_results = Kaminari.paginate_array(folders).page(args[:page]).per(7)

      MutationResultPaginated.call(
        obj: {
          folders: paginated_results,
        },
        loading: false,
        errors: [],
        current_page: paginated_results.current_page,
        total_pages: paginated_results.total_pages,
      )
    end
  end
end
