class Admin::CategoriesController < Admin::DashboardController
  def index
  	@categories = Category.all
  end

  def edit
  	@category = Category.find(params[:id])
  end
end
