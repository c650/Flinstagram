require_relative "../../config/environment.rb"
require_relative "../models/post.rb"
require_relative "../models/user.rb"
require "pry"
require "sinatra/base"

class ApplicationController < Sinatra::Base

# register Sinatra::Flash

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		set :sessions, true
		set :session_secret, "/plz_dnt_hrt_mh"
	end
######ROOT PAGE METHODS######
	get '/' do
		@users = User.all
		@posts = Post.all
		erb :index
	end

	post '/' do	
		@posts = Post.all
	end
######LOGIN METHODS######
	get '/login' do
        erb :login
  	end

  	post '/login' do
	    @user = User.find_by(username: params[:username])
	    if @user
	      session[:user_id] = @user.id
	      redirect to '/'
	    else
	      redirect to '/login'
	    end
  	end
######LOGOUT METHODS######
	get '/logout' do
	    session[:user_id] = nil
	    redirect '/login'
    end
######NEW USER######
	get '/new_user' do
		erb :new_user
	end

	post '/new_user' do
		User.create(username: params[:username])
		redirect to '/'
	end
######HELPER METHODS######
	def current_user
	    if logged_in?
	    	User.find(session[:user_id])
	    else
	    	nil
	    end
	end

    def logged_in?
      session[:user_id]
    end
end