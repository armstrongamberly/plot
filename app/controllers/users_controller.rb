class UsersController < ApplicationController

  get '/signup' do
    # if logged_in?
    #   redirect "/tweets"
    # end
    erb :"/users/create_users"
  end

  # post "/signup" do
  #   if params.has_value?("")
  #     redirect "/signup"
  #   end
  #   @user = User.create(:username => params[:username], email: params[:email], :password => params[:password])
  #   session[:user_id] = @user.id
  #   redirect '/markers/index'
  # end

  get '/login' do
    # if logged_in?
    #   redirect "/tweets"
    # end
    erb :"/users/login"
  end

#   post "/login" do
#     @user = User.find_by(:username => params[:username])
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id
#       redirect "/tweets"
#     # else
#     #   redirect "/login"
#     # end
# end
  # end

end