class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :spotfix_id
      t.integer :user_id
      t.string :type
      t.string :url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
