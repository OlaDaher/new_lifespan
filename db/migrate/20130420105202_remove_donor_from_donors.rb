class RemoveDonorFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :donor
  end

  def down
    add_column :donors, :donor, :boolean
  end
end
