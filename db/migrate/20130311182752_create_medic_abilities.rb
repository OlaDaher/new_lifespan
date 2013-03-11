class CreateMedicAbilities < ActiveRecord::Migration
  def change
    create_table :medic_abilities do |t|

      t.timestamps
    end
  end
end
