class AddCommentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comment do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
