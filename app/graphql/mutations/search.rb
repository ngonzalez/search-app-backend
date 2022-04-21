module Mutations
  class Search < Mutations::BaseMutation
    graphql_name "Search"

    argument :q, String, required: true
    argument :page, Integer, required: true
    argument :folder, String, required: true
    argument :subfolder, String, required: true

    field :results, [Types::FolderType], null: false
    field :current_page, Integer, null: false
    field :total_pages, Integer, null: false

    def resolve(args)
      if args[:q] && !args[:q].blank?
        folders = Folder.order("folder_created_at::timestamp DESC")
                    .where("data_url IS NOT NULL")
                    .search(args[:q])
      elsif args[:folder] && !args[:folder].blank? && args[:subfolder] && !args[:subfolder].blank?
        folders = Folder.order("folder_created_at::timestamp DESC")
                    .where("data_url IS NOT NULL")
                    .where(folder: args[:folder], subfolder: args[:subfolder])
      elsif args[:folder] && !args[:folder].blank?
        folders = Folder.order("folder_created_at::timestamp DESC")
                    .where("data_url IS NOT NULL")
                    .where(folder: args[:folder])
      else
        folders = Folder.order("folder_created_at::timestamp DESC")
                    .where("data_url IS NOT NULL")
      end

      paginated_results = Kaminari.paginate_array(folders).page(args[:page]).per(15)

      MutationResultPaginated.call(
        obj: {
          results: paginated_results,
        },
        loading: false,
        errors: [],
        current_page: paginated_results.current_page,
        total_pages: paginated_results.total_pages,
      )
    end
  end
end
