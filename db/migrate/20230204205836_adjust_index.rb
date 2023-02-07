# frozen_string_literal: true

class AdjustIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email, name:"index_users_on_email"
    
    add_index :users, :email,                unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
