class AddImportedDataToStudentsAndTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :imported_data, :boolean
    add_column :tutors, :imported_data, :boolean
  end
end
