class AddExistingMatchingIdAndImportedDataToClassrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :classrooms, :existing_matching_id, :string
    add_column :classrooms, :imported_data, :string
  end
end
