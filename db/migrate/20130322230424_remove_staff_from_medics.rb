class RemoveStaffFromMedics < ActiveRecord::Migration
  def up
    remove_column :medics, :staff
  end

  def down
    add_column :medics, :staff, :boolean
  end
end
