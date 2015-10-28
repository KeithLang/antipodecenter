class AddImageToCategory < ActiveRecord::Migration
  def change
    add_attachment :categories, :liberal_image
    add_attachment :categories, :conservative_image
  end
end
