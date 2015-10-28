class Admin::CategoriesController < Admin::DashboardController

  before_action :find_category, only: [ :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category created'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Something was wrong'
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @article.save
      flash[:notice] = 'Category saved'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Something was wrong'
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :liberal_image, :conservative_image)
  end
end
