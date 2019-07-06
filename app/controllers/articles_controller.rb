class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.includes(:user)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if current_user.id = @article.user.id
      @article.update(article_params)
      redirect_to root_url
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to root_url
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :image, :content)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
