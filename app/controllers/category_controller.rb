class CategoryController < ApplicationController

  def show
  
   
    #category = Category.first
    category = Category.find_by_name(params[:name])
    @articles = category.articles
  end
end
