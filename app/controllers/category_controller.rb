class CategoryController < ApplicationController

  def show
    category = Category.find_by_id(params[:id])
    #@article = @category.article
  end
end
