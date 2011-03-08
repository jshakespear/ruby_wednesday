class LicensesController < ApplicationController
	def index
	  @licenses = License.all(:order => :id)
		render :layout => 'application'
	end
	
	def show
	  @license = License.find(params[:id])
  end
end
