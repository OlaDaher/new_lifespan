class AddWeightToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :weight, :integer
  end
end
