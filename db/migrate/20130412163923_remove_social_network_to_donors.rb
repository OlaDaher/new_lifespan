class RemoveSocialNetworkToDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :social_netowrk
  end

  def down
    add_column :donors, :social_netowrk, :string
  end
end
