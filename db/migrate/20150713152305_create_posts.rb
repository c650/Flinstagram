class CreatePosts < ActiveRecord::Migration
  def up
  	create_table :posts do |t|
  		t.string :image_url
  		t.string :caption
  	end
  end

  def down
  	drop_table :posts
  end
end
