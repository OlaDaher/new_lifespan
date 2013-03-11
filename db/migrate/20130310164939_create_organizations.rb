class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :region, :default => ""

      t.timestamps
    end
  end
end
