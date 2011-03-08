class CategoriesController < ApplicationController
	#active_scaffold :categories do |config|
	#	config.list.columns = [:name, :order_index, :parent_id]
	#	config.create.columns = [:name, :order_index, :parent_id]
	#	#config.columns[:parent_id].form_ui = :select
	#end
	
	def sub_category_select_box
	  @category_select_box = Category.find(params[:category_id]) unless params[:category_id].empty?
	  render :layout => false
  end
end
