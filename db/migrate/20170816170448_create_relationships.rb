class CreateRelationships < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.integer    :user_id,           null: false
      t.integer    :follower_id,       null: false

      t.datetime :created_at,          null: false
      t.datetime :updated_at

    end
    add_index :relationships, [:user_id, :follower_id], unique: true
  end
  def down
    drop_table :relationships
  end
end
