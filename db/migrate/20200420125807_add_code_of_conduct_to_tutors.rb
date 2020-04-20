class AddCodeOfConductToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :code_of_conduct, :boolean
  end
end
