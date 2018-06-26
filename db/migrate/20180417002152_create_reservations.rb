class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date,   null: false
      t.integer :price,       default: 0
      t.integer :total_price, default: 0
      t.string :menu

      t.timestamps null: false
    end
  end
end
