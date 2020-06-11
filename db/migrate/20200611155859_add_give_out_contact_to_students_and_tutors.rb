class AddGiveOutContactToStudentsAndTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :give_out_contact, :boolean
    add_column :tutors, :give_out_contact, :boolean
  end
end
