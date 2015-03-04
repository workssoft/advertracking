class HomeController < ApplicationController

#before_filter :do_common_stuff

	#def do_common_stuff
		#@users = User.all
	#end

	def index
		if logged_in?
			#redirect_to "/"  #new_user_session_path
			#redirect_to root_path, notice: "You have."
		else
			redirect_to new_user_session_path  #new_user_session_path
		end
		
  end


end
