class AddDateOfBirthToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :date_of_birth, :date
  end
end
