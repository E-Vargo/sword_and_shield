class ShieldsController < ApplicationController

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



    # GET: /shields
    get "/shields" do
      if logged_in?
      @shields = Shield.all
      erb :"/shields/index.html"
      else
        redirect to '/login'
      end
    end

  # POST: /shields
  post "/shields" do
    if params[:defensiveness] != "" && params[:name] != "" && params[:value] != nil
      Shield.create(name: params[:name], value: params[:value], defensiveness: params[:defensiveness], user_id: params[:user_id])
    else
    redirect to "/shields/new"
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
    if logged_in?
    @shield = Shield.find(params[:id])
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
    redirect "/shields/:id"
  end

  # DELETE: /shields/5/delete
  delete "/shields/:id/delete" do
    redirect "/shields"
  end
end
