class SessionsController < ApplicationController
<<<<<<< HEAD
=======

	def new
		
	end

	def create
		admin = Admin.find_by(email: params[:session][:email].downcase)
		if admin && admin.authenticate(params[:session][:password])
			sign_in admin 
			redirect_back_or root_url
		else
			if admin 
				message = 'password Salah Men.'
			else
				message = 'Email tidak terdaftar.'
			end
			flash[:danger] = message

			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
end
