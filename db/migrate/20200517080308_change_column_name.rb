class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :feedbacks, :eleborate, :elaborate
  end
end
