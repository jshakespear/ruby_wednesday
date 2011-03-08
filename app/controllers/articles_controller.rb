include ArticlesHelper
class ArticlesController < ApplicationController
	#active_scaffold :articles do |config|
	#	config.list.columns = [:title]
	#	config.create.columns = [:title, :content]
	#end
  layout 'application'
  
  def article_faq
    
  end
  
  def chapters_and_sections
    @categories = Category.find_all_by_parent_id(nil)
  end
  
  def create
    session[:article_params].deep_merge!(params[:article]) if params[:article]
    @article = Article.new(session[:article_params])
    @article.current_step = session[:article_step]
    if @article.valid?
      if params[:back_button]
        @article.previous_step
      elsif @article.last_step?
        if current_user
          @article.user = current_user
        end
        @article.save if @article.all_valid?
        #ArticleCategory.new :article_id => @article.id, :category_id => @article.category_id
      else
        @article.next_step
      end
      session[:article_step] = @article.current_step
    end
    if @article.new_record?
      render "new"
    else
      session[:article_step] = session[:article_params] = nil
      flash[:notice] = "Article saved"
      redirect_to @article
    end
  end
  
  def edit
    if params[:id]
      article = Article.find(params[:id])
      if current_user
        if(article.user.id == current_user.id)
          @article = article
        end
      end
    end
  end
  
  def guidelines
    render :layout => 'no_left_nav'
  end
  
  def index
    @articles = Article.find(:all, {:order => 'updated_at desc'})    
  end
  
  def list_by_category
    @articles = get_articles_by_category_id(params[:category_id])
    @category = Category.find(params[:category_id])
    @parent_category = Category.find(@category.parent_id)
=begin
    if params[:category_id]
      @category = Category.find(params[:category_id])
      if Category.find(params[:category_id]).parent_id.nil?
        #Category.find_all_by_parent_id(params[:category_id]).each do |sub_category|
        #  @articles += sub_category.articles
        #end
      else
        @category = Category.find(params[:category_id])
        @parent_category = Category.find(@category.parent_id)
    	  #@articles = Article.where(["category_id=?", params[:category_id]])	
    	  @articles = @category.articles
  	  end
    end
=end
    @articles ||= []
    #render :layout => 'application'
  end

  def new
    if !user_signed_in?
      session[:"user.return_to"] = request.request_uri
      redirect_to new_user_session_path
    end
    session[:article_params] ||= {}
    @article = Article.new(session[:article_params])
    @article.current_step = session[:article_step]
  end

  def search
    @article = Article.new
  end

  def show
    @owner = false
    if params[:id]
      @article = Article.find(params[:id])
      if current_user
        if(@article.user.id == current_user.id)
          @owner = true
        end
      end
    end
    #@article ||= Article.new
    #render :layout => 'application'
  end

  def site_map
    
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to :action => 'show', :id => @article
    else
      render :action => 'edit'
    end
  end
  
  def view_popular_articles
    @articles = Article.find(:all, :limit =>30)
    @articles ||= []
    #render :layout => 'application'
  end
end
