class JavascriptsController < ApplicationController
  def dynamic_categories
    @categories = Category.find(:all, :conditions => 'parent_id IS NOT NULL ')
  end
end
