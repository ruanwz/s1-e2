class CreatePullRequests < ActiveRecord::Migration
  def self.up
    create_table :pull_requests do |t|
      t.text :content
      t.integer :source_repository_id
      t.integer :target_repository_id
      t.integer :user_id
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :pull_requests
  end
end
