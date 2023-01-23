class AddCountersToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comments_counter, :integer, default: 0
    add_column :comments, :likes_counter, :integer, default: 0
  end
end
