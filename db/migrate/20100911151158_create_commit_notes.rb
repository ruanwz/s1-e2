class CreateCommitNotes < ActiveRecord::Migration
  def self.up
    create_table :commit_notes do |t|
      t.text :note
      t.integer :commit_id 

      t.timestamps
    end
  end

  def self.down
    drop_table :commit_notes
  end
end
