class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_users'
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/signup"
    end
    @user = User.new(email: params["email"], username: params["username"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/markers'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/markers"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
