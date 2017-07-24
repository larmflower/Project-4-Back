class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :image
      t.integer :github_id
      t.string :facebook_id
      t.string :google_id
      t.string :instagram_id

      t.timestamps
    end
  end
end
