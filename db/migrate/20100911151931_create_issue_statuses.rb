class CreateIssueStatuses < ActiveRecord::Migration
  def self.up
    create_table :issue_statuses do |t|
      t.string :name
      t.datetime :created_at 

      t.timestamps
    end
  end

  def self.down
    drop_table :issue_statuses
  end
end
