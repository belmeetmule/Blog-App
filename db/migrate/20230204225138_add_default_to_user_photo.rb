class AddDefaultToUserPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, "https://whatsondisneyplus.com/wp-content/uploads/2022/09/andor-avatar.png"
  end
end
