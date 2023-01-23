class UpdateComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :comments_counter, :integer
    remove_column :comments, :likes_counter, :integer
    change_column_null :comments, :author_id, false
    change_column_null :comments, :post_id, false
  end
end
