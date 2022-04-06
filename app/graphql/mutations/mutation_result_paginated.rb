module Mutations
  class MutationResultPaginated
    def self.call(obj: {}, loading: false, errors: [], current_page: nil, total_pages: nil)
      obj.merge(loading: loading, errors: errors, current_page: current_page, total_pages: total_pages)
    end
  end
end
