class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :spotfix_id
      t.string :name
      t.integer :count
      t.string :description

      t.timestamps
    end
  end
end
