class RemoveUserFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :user
  end
end
