class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :label
      t.datetime :release_date
      t.decimal :price
      t.integer :store_id
      t.integer :artist_id
      t.integer :genre_id
      t.integer :user_id
      t.string :format

      t.timestamps
    end
  end
end
