class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.integer :repository_id
      t.integer :user_id
      t.integer :status_id
      t.text :content
      t.integer :closed_by
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
