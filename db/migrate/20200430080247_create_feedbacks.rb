class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.datetime :timestamp
      t.string :matching_number
      t.string :full_name
      t.text :action
      t.date :date_of_session
      t.time :start_time
      t.time :end_time
      t.string :understand_concepts
      t.boolean :observe_code_of_conduct
      t.string :eleborate
      t.text :topics_covered
      t.boolean :comfortable_with_tutor
      t.text :other_feedbacks
      t.string :know_about_program

      t.timestamps
    end
  end
end
