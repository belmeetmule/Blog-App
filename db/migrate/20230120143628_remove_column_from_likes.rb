class RemoveColumnFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :references, :string
  end
end
