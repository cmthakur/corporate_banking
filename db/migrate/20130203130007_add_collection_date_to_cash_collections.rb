class AddCollectionDateToCashCollections < ActiveRecord::Migration
  def change
    add_column :cash_collections, :received_on, :date
    add_column :cash_collections, :type, :string
    add_column :cash_collections, :description, :string
  end
end
