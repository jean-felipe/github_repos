class CreateUserRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_repositories do |t|
      t.string :url
      t.integer :stars
      t.string :node_id
      t.string :description
      t.string :name
      t.string :full_name
      t.bigint :github_id

      t.timestamps
    end
  end
end
