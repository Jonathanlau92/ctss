class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.boolean :personal_consent
      t.string :full_name
      t.string :school_email
      t.string :alternate_email
      t.integer :sex
      t.json :subject_preferences, null: false, default: {}
      t.integer :education_level
      t.boolean :parental_consent
      t.integer :match_count

      t.timestamps
    end
  end
end
