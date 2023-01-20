class RemoveColumnsFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :post, :string
  end
end
