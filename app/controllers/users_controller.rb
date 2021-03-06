class UsersController < ApplicationController

      # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  get '/users/:slug' do 
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @swords = Sword.all.select {|s| s.user_id == @user.id}
      @shields = Shield.all.select {|s| s.user_id == @user.id}
      if @user
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
    if params[:name] == "" || params[:password] == "" || User.all.find {|u| u.name == params[:name]}
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
