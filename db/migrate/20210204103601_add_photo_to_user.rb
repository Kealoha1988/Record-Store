class AddPhotoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string, default: "https://i.pinimg.com/474x/45/11/c5/4511c5871ff8011385b023be70878d81.jpg"
  end
end
