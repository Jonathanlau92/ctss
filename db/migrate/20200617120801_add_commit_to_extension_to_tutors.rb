class AddCommitToExtensionToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :commit_to_extension, :boolean
  end
end
