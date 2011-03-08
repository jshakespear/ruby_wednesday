# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :populate_categories
  helper :all # include all helpers, all the time
	layout 'application'
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def after_sign_in_path_for(resource)
      (session[:"user.return_to"].nil?) ? "/" : session[:"user.return_to"].to_s
  end

  def populate_categories
      @categories ||= Category.base_categories
      @sub_categories = []
  end
end
