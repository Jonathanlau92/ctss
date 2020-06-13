class AddSubjectMatchedToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :subject_matched, :string
  end
end
