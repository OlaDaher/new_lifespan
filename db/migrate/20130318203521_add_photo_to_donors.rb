class AddPhotoToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :photo, :string
  end
end
