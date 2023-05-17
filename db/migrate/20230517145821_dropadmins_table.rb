class DropadminsTable < ActiveRecord::Migration[7.0]
  def changedef up
    drop_table :admins
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
