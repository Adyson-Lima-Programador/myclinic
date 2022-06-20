class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :hour
      t.string :customer_id
      t.string :professional_id
      t.string :category

      t.timestamps
    end
  end
end
