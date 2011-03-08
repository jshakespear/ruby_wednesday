class Category < ActiveRecord::Base
  #has_and_belongs_to_many :articles, :join_table => 'articles_categories'
  #has_many :articles_categories
  has_and_belongs_to_many :articles #, :through => 'articles_categories'
  
  def self.base_categories
    Category.all(:conditions => 'parent_id IS NULL')
  end
end
