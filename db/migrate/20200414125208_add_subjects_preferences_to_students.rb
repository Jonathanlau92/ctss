class AddSubjectsPreferencesToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :subject_1, :string
    add_column :students, :subject_2, :string
    add_column :students, :subject_3, :string
    add_column :students, :others_subject, :string
  end
end
