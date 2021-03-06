class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :usr_comment_id
      t.string :usr_comment_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
