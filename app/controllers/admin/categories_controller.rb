class Admin::CategoriesController < Admin::DashboardController
  UPDATE_PARAMS = [:name]
  CREATE_PARAMS = [:name]  
  def index
  	@categories = Category.all
  end

  def new
    @category = Category.new
  end
  

  def create
    @category = Category.new
    local_params = params.require(:category).permit(CREATE_PARAMS)
    @category.attributes = local_params
    if @category.save
      flash[:notice] = 'Category created'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Something was wrong'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    local_params = params.require(:category).permit(UPDATE_PARAMS)
    @category.attributes = local_params
    if @article.save
      flash[:notice] = 'Category saved'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Something was wrong'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end    

end
