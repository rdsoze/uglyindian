class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :spotfix_id
      t.boolean :confirmed
      t.boolean :attended
      t.timestamps
    end
  end
end
