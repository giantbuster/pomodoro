module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
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


end
