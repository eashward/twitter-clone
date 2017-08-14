class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.datetime :created_at, null: false
      t.datetime :updated_at
    end
  end
end
