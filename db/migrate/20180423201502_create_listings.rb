class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :home_type
      t.string :listing_type
      t.text :summary
      t.string :address
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_heating
      t.boolean :is_internet
      t.integer :accomodate
      t.integer :bedroom
      t.integer :bathroom
      t.integer :sheet
      t.integer :price
      t.boolean :active
      t.integer :user_id
      t.string :listing_name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
