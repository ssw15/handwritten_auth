class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :from_name
      t.string :from_id
      t.string :message
      t.string :link
      t.string :facebook_id
      t.datetime :facebook_created_time

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
