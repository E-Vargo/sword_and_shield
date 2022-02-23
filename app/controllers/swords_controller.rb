class SwordsController < ApplicationController

  # GET: /swords
  get "/swords" do
    if logged_in?
    erb :'/swords/index.html'
    else
      erb :'/users/login.html'
    end
  end

  # GET: /swords/new
  get "/swords/new" do
    erb :"/swords/new.html"
  end

  # POST: /swords
  post "/swords" do
    redirect "/swords"
  end

  # GET: /swords/5
  get "/swords/:id" do
    erb :"/swords/show.html"
  end

  # GET: /swords/5/edit
  get "/swords/:id/edit" do
    erb :"/swords/edit.html"
  end

  # PATCH: /swords/5
  patch "/swords/:id" do
    redirect "/swords/:id"
  end

  # DELETE: /swords/5/delete
  delete "/swords/:id/delete" do
    redirect "/swords"
  end
end
