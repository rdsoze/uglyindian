class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :location
      t.string :age_range
      t.string :dob
      t.string :image
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
