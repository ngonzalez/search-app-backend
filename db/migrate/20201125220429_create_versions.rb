class CreateVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :versions do |t|
      t.string :item_type, null: false
      t.integer :item_id, null: false
      t.string :event, null: false
      t.string :whodunnit
      t.text :object
      t.datetime :created_at
      t.text :object_changes
      t.index [:item_type, :item_id], name: :index_versions_on_item_type_and_item_id
    end
  end
end
