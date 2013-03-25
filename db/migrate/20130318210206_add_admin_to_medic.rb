class AddAdminToMedic < ActiveRecord::Migration
  def change
    add_column :medics, :admin, :boolean, :default => false
  end
end
