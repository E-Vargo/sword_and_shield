class ShieldsController < ApplicationController

  # GET: /shields
  get "/shields" do
    erb :"/shields/index.html"
  end

  # GET: /shields/new
  get "/shields/new" do
    erb :"/shields/new.html"
  end

  # POST: /shields
  post "/shields" do
    redirect "/shields"
  end

  # GET: /shields/5
  get "/shields/:id" do
    erb :"/shields/show.html"
  end

  # GET: /shields/5/edit
  get "/shields/:id/edit" do
    erb :"/shields/edit.html"
  end

  # PATCH: /shields/5
  patch "/shields/:id" do
    redirect "/shields/:id"
  end

  # DELETE: /shields/5/delete
  delete "/shields/:id/delete" do
    redirect "/shields"
  end
end
