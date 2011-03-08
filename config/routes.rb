ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  #map.resources :articles
  #map.resources :categories
  #map.resources :users
  #map.resources :dynamic_javascripts
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.connect 'articles/chapters_and_sections', :controller => 'articles', :action => 'chapters_and_sections'
  map.connect 'articles/faq', :controller => 'articles', :action => 'faq'
  map.connect 'articles/guidelines', :controller => 'articles', :action => 'guidelines'
  map.connect 'articles/search', :controller => 'articles', :action => 'search'
  map.connect 'articles/site_map', :controller => 'articles', :action => 'site_map'
  map.connect 'articles/submission_wizard', :controller => 'articles', :action => 'submission_wizard'
  map.connect 'articles/submission_wizard_step_2', :controller => 'articles', :action => 'submission_wizard_step_2'
  #map.connect 'articles/:id', :controller => 'articles', :action => 'show'
  #map.connect 'articles', :controller => 'articles', :action => 'view_popular_articles'

  map.connect 'categories/:category_id/articles', :controller => 'articles', :action => 'list_by_category'

  #map.connect 'learning_zones', :controller => 'questions', :action => 'learning_zones'

  #map.connect 'licenses/', :controller => 'questions', :action => 'search'

  map.connect 'questions/search', :controller => 'questions', :action => 'search'

  map.resources :categories do |category|
    category.resources :articles
  end
  
  #map.resources :articles do |article|
  #  article.resources :categories
  #end
  
  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  map.resources :articles#, :active_scaffold => false
	map.resources :categories#, :active_scaffold => false
	map.resources :licenses#, :active_scaffold => false
	map.resources :users#, :active_scaffold => false
	map.resources :who_can_edit#, :active_scaffold => false
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
