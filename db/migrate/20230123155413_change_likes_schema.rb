class ChangeLikesSchema < ActiveRecord::Migration[7.0]
  def change
    change_column_null :likes, :author_id, false
  end
end
