class UpdateComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author_id, :integer, index: true, null: false
    add_column :comments, :post_id, :integer, index: true, null: false
    add_column :comments, :text, :text
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
