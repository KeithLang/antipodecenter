class Category < ActiveRecord::Base
  has_many :articles
  has_attached_file :liberal_image, styles: { medium: "210x150"}
  has_attached_file :conservative_image, styles: { medium: "210x150"}
  validates_attachment :liberal_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :conservative_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :name, :liberal_image, :conservative_image, presence: true
end
