class AddDefaultValueToMatchedAttributes < ActiveRecord::Migration[6.0]
  def up
    change_column_default :students, :matched, false
    change_column_default :tutors, :matched, false
  end

  def down
    change_column_default :students, :matched, nil
    change_column_default :tutors, :matched, nil
  end
end
