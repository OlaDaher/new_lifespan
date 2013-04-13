class AddDateOfBirthToMedics < ActiveRecord::Migration
  def change
    add_column :medics, :date_of_birth, :date
  end
end
