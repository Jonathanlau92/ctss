class ChangeImportDataTypeFromBooleanToString < ActiveRecord::Migration[6.0]
  def up
    change_column :students, :imported_data, :string
    change_column :tutors, :imported_data, :string
  end

  def down
    change_column :students, :imported_data, :boolean
    change_column :tutors, :imported_data, :boolean
  end
end
