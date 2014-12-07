class HomeController < ApplicationController
	def index
		if_user_redirect_to  
	end

	def if_user_redirect_to
		if current_user.present?
		  redirect_to dashboard_path
		end
	end
end
