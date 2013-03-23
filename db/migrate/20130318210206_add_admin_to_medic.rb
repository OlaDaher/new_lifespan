class AddAdminToMedic < ActiveRecord::Migration
  def change
    add_column :medics, :admin, :boolean
  end
end
