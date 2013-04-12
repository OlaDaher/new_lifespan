class RemoveActiveToDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :active
  end

  def down
    add_column :donors, :active, :boolean
  end
end
