class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  # GET /articles/:id
  # GET /articles/new
  # POST /articles
  # PATCH/PUT /articles/:id
  # DELETE /articles/:id
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, status: :see_other
  end
  # GET /articles/:id/edit

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end
