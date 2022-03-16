class UsersController < ApplicationController

      # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
    #@swords = Sword.all.collect {|s| s.user_id == nil}
  end

  get '/users/:slug' do 
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      if @user
        @user.swords ? @swords = @user.swords : @swords = nil
        @user.shields ? @shields = @user.shields : @shields = nil
      erb :'users/show.html'
      else
        redirect to '/users'
      end
    else 
      redirect to '/login'
    end
  end

  # GET: /users
  get "/users" do
    @users = User.all
    if logged_in?
    erb :"/users/index.html"
    else 
      redirect to '/login'
    end
  end

  # POST: /users
  post "/users" do
    if params[:name] == "" || params[:password] == ""
      redirect to '/users/new'
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/users'
    end
  end

  get "/login" do 
    if !logged_in?
      erb :'users/login.html'
    else 
      redirect to '/users'
    end
   
  end

  post '/login' do 
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect to '/users'
    else
      redirect to '/login'
    end
  end

  # GET: /users/5
  get "/users/:id" do
    if logged_in?
    @user = User.find(params[:id])
    @swords = Sword.all.collect {|s| s.user_id == @user.id}
    erb :"/users/show.html"
    else 
      redirect to '/login'
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if session[:user_id] == User.find(params[:id]).id
      @user = User.find(params[:id])
    erb :"/users/edit.html"
    else 
      redirect to '/users'
    end
  end

  # PATCH: /users/5
  patch '/users/:id' do
  
    if params[:name] != ""
      @user = User.find(params[:id])
      @user.update(name: params[:name])
      redirect to '/users'
    else
    redirect to "/users"
    end
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/logout' do 
    if !logged_in?
        redirect to '/'
    else
        session.destroy
        redirect to '/login'
    end
end
end
