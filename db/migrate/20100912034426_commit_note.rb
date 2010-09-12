class CommitNote < ActiveRecord::Migration
  def self.up
    add_column :commit_notes, :file_path, :string
    add_column :commit_notes, :line_number, :integer
  end

  def self.down
    remove_column :commit_notes, :file_path
    remove_column :commit_notes, :line_number
  end
end
