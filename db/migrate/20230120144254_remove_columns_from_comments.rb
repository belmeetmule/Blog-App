class RemoveColumnsFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :user_id, :bigint
    remove_column :comments, :post, :string
  end
end
