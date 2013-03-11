class CreateDonorAbilities < ActiveRecord::Migration
  def change
    create_table :donor_abilities do |t|

      t.timestamps
    end
  end
end
