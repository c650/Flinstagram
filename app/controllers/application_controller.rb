require_relative "../../config/environment.rb"
require_relative "../models/post.rb"
require_relative "../models/user.rb"
require "pry"
require "sinatra/base"

class ApplicationController < Sinatra::Base

register Sinatra::Flash

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		set :sessions, true
		set :session_secret, "/plz_dnt_hrt_mh"
	end

	get '/' do
		@users = User.all
		@posts = Post.all
		erb :index
	end

	post '/' do
		
		@posts = Post.all
	end

end