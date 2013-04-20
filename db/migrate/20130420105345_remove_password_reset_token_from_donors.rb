class RemovePasswordResetTokenFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :password_reset_token
  end

  def down
    add_column :donors, :password_reset_token, :string
  end
end
