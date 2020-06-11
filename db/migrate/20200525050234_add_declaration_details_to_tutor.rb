class AddDeclarationDetailsToTutor < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :declare_1, :boolean
    add_column :tutors, :declare_2, :boolean
    add_column :tutors, :declare_3, :boolean
    add_column :tutors, :declare_4, :boolean
  end
end
