class CreateRepositoryTypes < ActiveRecord::Migration
  def self.up
    create_table :repository_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :repository_types
  end
end
