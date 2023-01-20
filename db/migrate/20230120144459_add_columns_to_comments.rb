class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author_id, :bigint
    add_index :comments, :author_id
    add_column :comments, :post_id, :bigint
    add_index :comments, :post_id
  end
end
