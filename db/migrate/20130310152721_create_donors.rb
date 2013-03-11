class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :region
      t.boolean :active
      t.string :blood_type
      t.string :social_network
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end


