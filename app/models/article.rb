class Article < ActiveRecord::Base
  attr_writer :current_step
  
  #validates_presence_of :article_title, :if => lambda { |a| a.current_step == "1" }
  #has_and_belongs_to_many :categories, :join_table => 'articles_categories'
  #has_many :articles_categories
  has_and_belongs_to_many :categories#, :through => 'articles_categories'
  belongs_to :license
  belongs_to :user
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
  
  def current_step
    @current_step || steps.first
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def steps
    %w[1 2 3]
  end
end