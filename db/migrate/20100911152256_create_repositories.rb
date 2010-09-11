class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.integer :user_id
      t.integer :type_id
      t.integer :fork_by
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
