class AddDonorToDonor < ActiveRecord::Migration
  def change
    add_column :donors, :donor, :boolean, :default => true
  end
end
