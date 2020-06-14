class CreateGithubSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :github_secrets, id: :uuid do |t|
      t.uuid :secret

      t.timestamps
    end
  end
end
