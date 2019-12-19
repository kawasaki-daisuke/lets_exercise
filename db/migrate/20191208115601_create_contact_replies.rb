class CreateContactReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_replies do |t|
    	t.integer :contact_id
    	t.text :reply_content
    	t.string :email
    	t.datetime :created_at
    	t.datetime :updated_at

      t.timestamps
    end
  end
end
