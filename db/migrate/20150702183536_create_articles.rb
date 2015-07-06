class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :party, limit: 10
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
