class AddPhotoToMedics < ActiveRecord::Migration
  def change
    add_column :medics, :photo, :string
  end
end
