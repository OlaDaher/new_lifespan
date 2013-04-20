class RemovePasswordResetSentAtFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :password_reset_sent_at
  end

  def down
    add_column :donors, :password_reset_sent_at, :datetime
  end
end
