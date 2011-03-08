class Question < ActiveRecord::Base
  has_and_belongs_to_many :categories, :join_table => 'categories_questions'
end