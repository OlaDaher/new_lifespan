class RemoveEmailFromOrganizations < ActiveRecord::Migration
  def up
    remove_column :organizations, :email
  end

  def down
    add_column :organizations, :email, :string
  end
end
