class Commit < ActiveRecord::Migration
  def self.up
    add_column :commits, :user_id, :integer
    add_column :commits, :repository_id, :integer
    add_column :commits, :parent_id, :integer
  end

  def self.down
    remove_column :commits, :user_id
    remove_column :commits, :repository_id
    remove_column :commits, :parent_id
  end
end
