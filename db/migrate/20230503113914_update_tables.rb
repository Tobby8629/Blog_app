class UpdateTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :author_id_id, :author_id
    rename_column :posts, :commentCounter, :comment_counter
    rename_column :likes, :author_id_id, :author_id
    rename_column :likes, :post_id_id, :post_id
    rename_column :users, :postCounter, :posts_counter
    rename_column :posts, :likeCounter, :likes_counter
  end
end
