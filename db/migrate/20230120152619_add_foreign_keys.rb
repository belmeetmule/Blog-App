class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :posts, :users, column: :author_id
    add_foreign_key :likes, :posts
  end
end
