class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :headline
      t.string :src
      t.string :categories
      t.string :image
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
