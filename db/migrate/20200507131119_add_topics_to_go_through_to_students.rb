class AddTopicsToGoThroughToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :topics_to_go_through, :text
  end
end
