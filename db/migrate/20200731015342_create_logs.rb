class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :image
      t.text :comment
      t.string :tag
      t.string :url

      t.timestamps
    end
  end
end
