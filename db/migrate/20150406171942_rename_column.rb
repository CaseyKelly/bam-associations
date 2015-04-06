class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :appointments, :day, :date
  end
end
