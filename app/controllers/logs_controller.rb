class LogsController < ApplicationController
	def create
		@log = Log.new(log_create_params)
		if @log.save
			current_user.logs << @log
			redirect_to :back
		else
			render text: @log.errors.full_messages
		end
	end
	def update
		@log = current_user.logs.last.update(log_update_params)
		session[:working] = true
		redirect_to :back
	end

	private
	def log_create_params
		params.require(:log).permit(:task)
	end
	def log_update_params
		params.require(:log).permit(:result)
	end
end