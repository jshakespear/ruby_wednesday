module ArticlesHelper
  def get_articles_by_category_id(category_id)
    if Category.find(category_id).parent_id.nil?
      Article.find_all_by_category_id(category_id)
      #Category.find_all_by_parent_id(category_id).each do |sub_category|
      #  count += sub_category.articles.count
      #end
    else
      Article.find_all_by_sub_category_id(category_id)
    end
  end
end
