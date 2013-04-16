class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :content
      t.time :posted_at

      t.timestamps
    end
  end
end
