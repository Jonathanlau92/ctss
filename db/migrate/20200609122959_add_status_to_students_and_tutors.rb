class AddStatusToStudentsAndTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :status, :string
    add_column :tutors, :status, :string
  end
end
