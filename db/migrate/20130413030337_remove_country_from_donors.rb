class RemoveCountryFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :country
  end

  def down
    add_column :donors, :country, :string
  end
end
