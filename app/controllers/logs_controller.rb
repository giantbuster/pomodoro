class LogsController < ApplicationController
	def create
		@log = Log.new(log_create_params)
		if @log.save
			current_user.logs << @log
			session[:state] = 3
			respond_to do |format|
				format.html { redirect_to :back }
		        format.js
			end
		else
			redirect_to :back
			# respond_to do |format|
			# 	format.html { redirect_to :back, flash: { errors:@log.errors.full_messages }}
			# end
		end
	end
	def update
		@log = current_user.logs.last.update(log_update_params)
		session[:state] = 1
		respond_to do |format|
			format.html { redirect_to :back }
	        format.js
		end
	end

	private
	def log_create_params
		params.require(:log).permit(:task)
	end
	def log_update_params
		params.require(:log).permit(:result)
	end
end