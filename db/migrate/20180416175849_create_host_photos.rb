class CreateHostPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :host_photos do |t|
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
