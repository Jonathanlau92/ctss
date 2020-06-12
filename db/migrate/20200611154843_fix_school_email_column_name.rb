class FixSchoolEmailColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :students, :school_email, :email
    rename_column :tutors, :school_email, :email
  end

  def self.down
    # rename back if you need or do something else or do nothing
    rename_column :students, :email, :school_email
    rename_column :tutors, :school_email, :email
  end
end
