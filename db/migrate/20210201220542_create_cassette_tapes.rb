class CreateCassetteTapes < ActiveRecord::Migration[6.1]
  def change
    create_table :cassette_tapes do |t|
      t.string :title
      t.string :artist
      t.string :record_label
      t.string :relase
      t.string :date
      t.decimal :price

      t.timestamps
    end
  end
end
