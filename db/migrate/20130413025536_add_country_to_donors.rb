class AddCountryToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :country, :string
  end
end
