class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :pet, index: true
      t.references :doctor, index: true
      t.date :visit_date
      t.boolean :requires_reminder, default: false
      t.string :visit_reason

      t.timestamps null: false
    end
    add_foreign_key :appointments, :pets
    add_foreign_key :appointments, :doctors
  end
end
