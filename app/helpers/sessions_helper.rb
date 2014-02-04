module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
		session[:working] = true
	end

	def sign_out
		session[:user_id] = nil
	end

	def signed_in?
		if session[:user_id].nil?
			false
		else
			true
		end
	end

	def current_user
		@current_user||=User.find(session[:user_id])
	end
end
