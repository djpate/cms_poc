class ArticlesController < ApplicationController
  
  def show
    @article = Article.published
                      .friendly
                      .find(params[:id])
  end

end
