class UsersController < ApplicationController

  get '/signup' do
    # if logged_in?
    #   redirect "/tweets"
    # end
    erb :"/users/create_users"
  end
end