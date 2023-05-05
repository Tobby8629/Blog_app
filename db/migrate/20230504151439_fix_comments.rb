class FixComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :author_id_id, :bigint
    remove_column :comments, :post_id_id, :bigint
  end
end
