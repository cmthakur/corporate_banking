class AddImageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :image, :string
    add_column :profiles, :mcp, :string
  end
end
