class RemoveColumnssFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :text, :text
    remove_column :likes, :use_id, :integer
  end
end
