# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
  
  def title(title)
    content_for(:title) { title }
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
end
