class AddLevelToTeachToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :level_to_teach, :string
  end
end
