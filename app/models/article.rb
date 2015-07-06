class Article < ActiveRecord::Base
  belongs_to :category

  validates :title, :url, :party, :category_id, presence: true

end
