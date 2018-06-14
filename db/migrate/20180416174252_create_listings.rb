class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :home_type,     limit: 50
      t.string :listing_type,  limit: 50
      t.text :summary,         limit: 250
      t.integer :zip_code,     default: 0
      t.string :state,         limit: 50
      t.string :city,          limit: 50
      t.string :address,       limit: 50
      t.boolean :is_tv,        default: false, null: false
      t.boolean :is_kitchen,   default: false, null: false
      t.boolean :is_air,       default: false, null: false
      t.boolean :is_heating,   default: false, null: false
      t.boolean :is_internet,  default: false, null: false
      t.integer :accomodate,   default: 0
      t.integer :bedroom,      default: 0
      t.integer :bathroom,     default: 0
      t.integer :sheet,        default: 0
      t.integer :price,        default: 0
      t.boolean :active,       default: false, null: false
      t.references :user, index: true, foreign_key: true
      t.string :listing_name,  limit: 50
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
