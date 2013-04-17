class AddPasswordResetsDonorToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :password_resets_donor_token, :string
    add_column :donors, :password_resets_donor_sent_at, :datetime
  end
end
