class CreateUsers < ActiveRecord::Migration[7.0]
  def change
      add_column :users, :name, :string 
      add_column :users, :photo, :text
      add_column :users, :bio, :string 
      add_column :users, :postsCounter, :integer 
  end
end
