class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :to_user_id, null: false, foreign_key: true
      t.bigint :from_user_id, null: false, foreign_key: true
      t.integer :status, null: false
      t.timestamps
    end
  end
end
