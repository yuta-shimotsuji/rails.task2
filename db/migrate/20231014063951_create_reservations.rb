class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_day
      t.date :last_day
      t.integer :stay_days
      t.integer :number_of_people
      t.integer :total_amount

      t.timestamps
    end
  end
end
