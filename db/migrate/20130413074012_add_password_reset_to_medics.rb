class AddPasswordResetToMedics < ActiveRecord::Migration
  def change
    add_column :medics, :password_reset_token, :string
    add_column :medics, :password_reset_sent_at, :datetime
  end
end
