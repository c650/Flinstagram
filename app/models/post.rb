require_relative "../../config/environment"
class Post < ActiveRecord::Base
	belongs_to :user
end