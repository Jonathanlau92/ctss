class AddSpecificLevelToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :specific_level, :integer
  end
end
