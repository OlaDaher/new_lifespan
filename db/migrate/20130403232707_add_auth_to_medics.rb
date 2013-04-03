class AddAuthToMedics < ActiveRecord::Migration
  def change
    add_column :medics, :auth_token, :string
  end
end
