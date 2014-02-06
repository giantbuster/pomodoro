class LogsController < ApplicationController
	# State 1
	# Process 'Start Pomodoro' form
	def create
		@log = Log.new(log_create_params)
		if @log.save
			current_user.logs << @log
			session[:state] = 2
			respond_to do |format|
				format.html { redirect_to :back }
		        format.js
			end
		else
			redirect_to :back
		end
	end

	# State 2
	# Display work timer, show 'end session button'
	# Process 'end session' button
	def update_ended_at
		@log = current_user.logs.last
		@log.update(ended_at: Time.now)
		session[:state] = 3
		respond_to do |format|
			format.html { redirect_to :back }
	        format.js
		end
	end

	# State 3
	# Process 'Log results' form
	def update_result
		if log_update_result_params[:result].length==0 || log_update_result_params[:result].length>120
			respond_to do |format|
				format.html { redirect_to :back }
			end
		else
			@log = current_user.logs.last.update(log_update_result_params)
			session[:state] = 4
			respond_to do |format|
				format.html { redirect_to :back }
		        format.js
		    end
		end
	end

	# State 4
	# Display break timer, display 'start work' button
	# Process 'Start work' button
	def start_work
		session[:state] = 1
		@log = Log.new
		respond_to do |format|
			format.html { redirect_to :back }
	        format.js
		end
	end

	private
	def log_create_params
		params.require(:log).permit(:task)
	end
	def log_update_result_params
		params.require(:log).permit(:result)
	end
end