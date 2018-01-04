class AddPhotographerToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :photographer, :string
  end
end
