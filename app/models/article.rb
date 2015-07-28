class Article < ActiveRecord::Base
  belongs_to :category

  validates :title, :url, :party, :category_id, presence: true

  scope :by_party, -> (party) { where(party: party)}
end
