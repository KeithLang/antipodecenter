class AddAlternativeUrlToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :alternative_url, :string
  end
end
