class RenameAlbumToAlbumn < ActiveRecord::Migration[6.1]
  def change
    rename_table :albums, :albumns
  end
end
