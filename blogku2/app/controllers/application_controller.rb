class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
=======
  include SessionsHelper
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
end
