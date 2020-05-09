class RenameClassroomTable < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :classrooms, :matches
  end

  def self.down
    rename_table :matches, :classrooms
  end
end
