class AddDetailsToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :qualification, :integer
    add_column :tutors, :past_experiences, :text
    add_column :tutors, :reason_for_volunteering, :text
  end
end
