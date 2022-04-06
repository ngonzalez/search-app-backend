module Mutations
  class MutationResult
    def self.call(obj: {}, loading: false, errors: [])
      obj.merge(loading: loading, errors: errors)
    end
  end
end
