class HomeController < ApplicationController
	def index
	  @surveys = []
	  @featured_article = Article.find(:last)
	  @latest_best_picks = []
	end
end
