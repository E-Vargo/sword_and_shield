class SwordsController < ApplicationController

  get '/swords/:slug' do 
    if logged_in?
      @sword = Sword.find_by_slug(params[:slug])
      if @sword
        @sword.user ? @user = @sword.user : @user = nil
      erb :'swords/show.html'
      else
        redirect to '/swords'
      end
    else 
      redirect to '/login'
    end
  end

  # GET: /swords
  get "/swords" do
    @swords = Sword.all
    if logged_in?
    erb :'/swords/index.html'
    else
      erb :'/users/login.html'
    end
  end

  # GET: /swords/new
  get "/swords/new" do
    erb :'/swords/new.html'
  end

  # POST: /swords
  post "/swords" do
    if params[:name] == "" || params[:value] == "" || params[:lethality] == ""
      redirect to "/swords/new"
    else 
      @sword = Sword.create(name: params[:name], value: params[:value].to_i, lethality: params[:lethality])
      redirect to '/swords'
    end
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
