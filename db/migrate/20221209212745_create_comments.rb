class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :post
      t.string :references
      t.text :text

      t.timestamps
    end
  end
end
