class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :region, :default => ""
      t.boolean :active, :default => true
      t.string :blood_type, :default => ""
      t.string :social_network, :default => ""
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end


