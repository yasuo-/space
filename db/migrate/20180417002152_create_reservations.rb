class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date,   null: false
      t.time :start_time,     null: false
      t.time :end_time,       null: false
      t.integer :price,       default: 0
      t.integer :total,       default: 0
      t.string :menu

      t.timestamps
    end
  end
end
