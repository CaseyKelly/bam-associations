class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :doctor, index: true
      t.date :day
    end
    add_foreign_key :appointments, :users
    add_foreign_key :appointments, :doctors
  end
end
