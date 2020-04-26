class AddExistingEducationalLevelDataToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :existing_educational_level_data, :string
  end
end
