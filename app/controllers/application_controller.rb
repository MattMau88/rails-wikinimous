class ApplicationController < ActionController::Base
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def create
    # new record with values from form
    @article = Article.new(article_params)
    #save record
    @article.save
    #redirect to another page
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
