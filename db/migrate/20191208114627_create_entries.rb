class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
    	t.integer :user_id
    	t.integer :room_id
    	t.datetime :created_at
    	t.datetime :updated_at


      t.timestamps
    end
  end
end