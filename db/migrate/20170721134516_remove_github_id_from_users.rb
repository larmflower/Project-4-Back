class RemoveGithubIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :github_id, :string
  end
end
