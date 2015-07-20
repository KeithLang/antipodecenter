class Admin::ArticlesController < Admin::DashboardController
  UPDATE_PARAMS = [:title, :url, :party, :category_id]
  def index
  	@articles = Article.all
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    local_params = params.require(:article).permit(UPDATE_PARAMS)
    @article.attributes = local_params
    if @article.save
      flash[:notice] = 'Article saved'
      redirect_to admin_articles_path
    else
      flash[:error] = 'Something was wrong'
      render :edit
    end
  end  

end
