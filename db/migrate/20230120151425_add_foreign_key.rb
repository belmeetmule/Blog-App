class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :posts
  end
end
