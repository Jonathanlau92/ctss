class ChangeDefaultValueOfMatchCount < ActiveRecord::Migration[6.0]
  def up
    change_column_default :students, :match_count, 0
    change_column_default :tutors, :match_count, 0
  end

  def down
    change_column_default :students, :match_count, nil
    change_column_default :tutors, :match_count, nil
  end
end
