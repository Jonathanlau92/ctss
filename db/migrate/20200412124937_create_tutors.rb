class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.boolean :personal_consent
      t.string :full_name
      t.string :school_email
      t.string :alternate_email
      t.integer :sex
      t.json :subjects, null: false, default: {}
      t.integer :hours_to_teach
      t.integer :match_count

      t.timestamps
    end
  end
end
