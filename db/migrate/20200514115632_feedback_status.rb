class FeedbackStatus < ActiveRecord::Migration[6.0]
   def change
  	add_column :feedbacks, :step, :string
  	add_column :feedbacks, :identity, :string
  end
end
