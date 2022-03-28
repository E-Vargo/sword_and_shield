class ShieldsController < ApplicationController

  
    # GET: /shields
    get "/shields" do
      if logged_in?
      @shields = Shield.all
        erb :"/shields/index.html"
      else
        redirect to '/login'
      end
    end

    # GET: /shields/new
    get "/shields/new" do
      @users = User.all
      if logged_in?
      erb :"/shields/new.html"
      else 
        redirect to '/login'
      end
    end


  get '/shields/:slug' do 
    if logged_in?
      @shield = Shield.find_by_slug(params[:slug])
      if @shield
        @shield.user ? @user = @shield.user : @user = nil
      erb :'shields/show.html'
      else
        redirect to '/shields'
      end
    else 
      redirect to '/login'
    end
  end

  # POST: /shields
  post "/shields" do
    if params[:defensiveness] == "" || params[:name] == "" || params[:value] == ""
      redirect to '/shields/new'
    else
      @shield = Shield.create(name: params[:name], value: params[:value].to_i, defensiveness: params[:defensiveness], user_id: params[:user_id])
      @shield.user_id = params[:owner].to_i
      @shield.save
      redirect to '/shields'
    end
  end

  # GET: /shields/5
  get "/shields/:id" do
    if logged_in?
    @shield = Shield.find(params[:id])
    erb :"/shields/show.html"
    else
      redirect to '/login'
    end
  end

  # GET: /shields/5/edit
  get "/shields/:id/edit" do
    @users = User.all
    @shield = Shield.find(params[:id])
    if logged_in?
      if @shield && @shield.user == current_user
        erb :"/shields/edit.html"
      else
        redirect to '/shields'
      end
    else 
      redirect to '/login'
    end
  end

  # PATCH: /shields/5
  patch "/shields/:id" do
    if params[:defensiveness] == "" || params[:name] == "" || params[:value] == ""
    redirect to '/shields'
    else
      @shield = Shield.find_by_id(params[:id])
      @shield.update(name: params[:name], value: params[:value].to_i, defensiveness: params[:defensiveness], user_id: params[:owner].to_i)
      redirect to '/shields'
    end
  
  end

  # DELETE: /shields/5/delete
  delete "/shields/:id/delete" do
    redirect "/shields"
  end
end
