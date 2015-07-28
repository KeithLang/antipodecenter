class Admin::ArticlesController < Admin::DashboardController
  UPDATE_PARAMS = [:title, :url, :party, :category_id, :alternative_url]
  CREATE_PARAMS = [:title, :url, :party, :category_id, :alternative_url]

  before_action :fetch_article, only: [:edit, :update, :destroy]
  
  def index
  	@articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    local_params = params.require(:article).permit(CREATE_PARAMS)
    @article.attributes = local_params
    if @article.save
      flash[:notice] = 'Article created'
      redirect_to admin_articles_path
    else
      flash[:error] = 'Something was wrong'
      render :new
    end
  end  

  def edit
  end

  def update
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

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end  

  private 

  def fetch_article
    @article = Article.find(params[:id])
  end

end
