class AddToStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :password_digest, :string
  end
end
