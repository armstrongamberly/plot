class MarkersController < ApplicationController

  # GET: /markers
  get "/markers" do
    if logged_in?
      @user = User.find(session[:user_id])
      erb :"/markers/index.html"
    else
      redirect "/login"
    end
  end

  # GET: /markers/new
  get "/markers/new" do
    if logged_in?
      erb :"/markers/new.html"
    else
      redirect "/login"
    end
  end

  # POST: /markers
  post "/markers" do
    if params.has_value?("")
      redirect '/markers/new'
    else
      @marker = Marker.create(name: params[:name], location: params[:location], website: params[:website], details: params[:details],user_id: current_user.id)
      @marker.save
      redirect "/markers/#{@marker.id}"
    end
  end

  # GET: /markers/5
  get "/markers/:id" do
    if logged_in?
      @marker = Marker.find_by_id(params[:id])
      erb :"/markers/show.html"
    else
      redirect '/login'
    end
  end

  # GET: /markers/5/edit
  get "/markers/:id/edit" do
    erb :"/markers/edit.html"
  end

  # PATCH: /markers/5
  patch "/markers/:id" do
    redirect "/markers/:id"
  end

  # DELETE: /markers/5/delete
  delete "/markers/:id/delete" do
    redirect "/markers"
  end
end
