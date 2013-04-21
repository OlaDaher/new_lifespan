class AddGenderToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :gender, :string
  end
end
