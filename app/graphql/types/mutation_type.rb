module Types
  class MutationType < Types::BaseObject
    field :search, mutation: Mutations::Search
    field :show_item, mutation: Mutations::ShowItem
  end
end
