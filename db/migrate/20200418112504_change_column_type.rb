class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :tutors, :qualification, :string
  end
end
