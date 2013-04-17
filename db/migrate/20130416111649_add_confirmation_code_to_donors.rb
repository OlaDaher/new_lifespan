class AddConfirmationCodeToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :confirmation_code, :string
  end
end
