class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    erb :'/users/create_users'
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/signup"
    else
    @user = User.new(email: params["email"], username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    redirect '/markers'
    end
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
