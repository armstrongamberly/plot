class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    erb :'/users/create_users'
  end

  post '/signup' do
      @user = User.new(email: params["email"], username: params["username"], password: params["password"])
      @user.save
      session[:user_id] = @user.id
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
      flash[:message] = "Something about that didn't seem right. Try logging in again or click the link below to sign up."
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
