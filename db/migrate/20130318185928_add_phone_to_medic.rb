class AddPhoneToMedic < ActiveRecord::Migration
  def change
    add_column :medics, :phone, :string
  end
end
