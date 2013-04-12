class RemoveSocialNetworkFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :social_network
  end

  def down
    add_column :donors, :social_network, :string
  end
end
