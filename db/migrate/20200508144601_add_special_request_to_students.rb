class AddSpecialRequestToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :special_request, :string
  end
end
