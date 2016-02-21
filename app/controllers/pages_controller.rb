class PagesController < ApplicationController
	
	def about
	  @felix= "My Name Is Felix"
	  #render :contact
	end

	def contact		  
      @felix= "My Name Is Felix"
	end

end
