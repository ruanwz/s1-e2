class CreatePullCommits < ActiveRecord::Migration
  def self.up
    create_table :pull_commits do |t|
      t.integer :pull_request_id
      t.integer :start_commit_id
      t.integer :end_commit_id
      t.integer :user_id
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :pull_commits
  end
end
