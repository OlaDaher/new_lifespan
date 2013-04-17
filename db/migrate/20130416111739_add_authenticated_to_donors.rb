class AddAuthenticatedToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :authenticated, :boolean
  end
end
