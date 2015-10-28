class Admin::ArticlesController < Admin::DashboardController

  before_action :find_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
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
    @article.update(article_params)
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
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :url, :party, :category_id, :alternative_url)
  end
end
