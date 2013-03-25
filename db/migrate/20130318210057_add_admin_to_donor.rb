class AddAdminToDonor < ActiveRecord::Migration
  def change
    add_column :donors, :admin, :boolean, :default => false
  end
end
