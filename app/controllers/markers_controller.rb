class MarkersController < ApplicationController
  use Rack::Flash
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
    @marker = Marker.create(name: params[:name], location: params[:location], website: params[:website], details: params[:details],user_id: current_user.id)
    @marker.save
    redirect "/markers/#{@marker.id}"
  end

  # GET: /markers/5
  get "/markers/:id" do
    @marker = Marker.find_by_id(params[:id])
    if logged_in?
      erb :"/markers/show.html"
    else
      redirect '/login'
    end
  end

  # GET: /markers/5/edit
  get "/markers/:id/edit" do
    @marker = Marker.find_by_id(params[:id])
    if logged_in? && @marker.user_id == current_user.id
        erb :"/markers/edit.html"
    else
      flash[:notice] = "You must be the owner of a marker to edit."
      redirect '/markers'
    end
  end


  # PATCH: /markers/5
  patch "/markers/:id" do
    @marker = Marker.find_by_id(params[:id])
    if logged_in? && @marker.user_id == current_user.id
      @marker.update(name: params[:name], location: params[:location], website: params[:website], details: params[:details])
      redirect "/markers/#{@marker.id}"
    else
      flash[:notice] = "You must be the owner of a marker to edit."
      redirect '/markers'
    end
  end


  # DELETE: /markers/5/delete
  delete "/markers/:id/delete" do
    @marker = Marker.find_by_id(params[:id])
    if logged_in? && @marker.user_id == current_user.id
        @marker.delete
        redirect '/markers'
    else
      redirect to '/login'
    end
  end

end
