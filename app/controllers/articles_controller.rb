class ArticlesController < ApplicationController
  
  def start
    @article = Article.find_by_title("start")
    redirect_to(@article)
  end
  
  # GET /articles
  def index
    @articles = Article.all
  end
  
  # GET /articles/start
  def show
    @article = Article.find_by_title(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/start/edit
  def edit
    @article = Article.find_by_title(params[:id])
  end
  
  # GET /article/search (works?)
  def search
    if params[:q] then
      @query = params[:q]
      @results = Article.new.search(params[:q])
    end
  end
  
  # POST /articles
  def create
    @article = Article.new(params[:article])

    if @article.save
      redirect_to(@article, :notice => 'Article was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /articles/title
  def update
    @article = Article.find_by_title(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to(@article, :notice => 'Article was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /articles/start
  def destroy
    @article = Article.find_by_title(params[:id])
    @article.destroy

    redirect_to(articles_url)
  end
   
end
