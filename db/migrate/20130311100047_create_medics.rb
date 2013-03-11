class CreateMedics < ActiveRecord::Migration
  def change
    create_table :medics do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :organization_id, :default => ""
      t.boolean :staff
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
