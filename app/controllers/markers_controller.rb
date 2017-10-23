class MarkersController < ApplicationController

  # GET: /markers
  get "/markers" do
    erb :"/markers/index.html"
  end

  # GET: /markers/new
  get "/markers/new" do
    erb :"/markers/new.html"
  end

  # POST: /markers
  post "/markers" do
    redirect "/markers"
  end

  # GET: /markers/5
  get "/markers/:id" do
    erb :"/markers/show.html"
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
