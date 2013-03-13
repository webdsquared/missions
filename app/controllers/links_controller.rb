class LinksController < ApplicationController

	def index
		@blog_list = Blog.order("name asc")
    	@latest_posts = Post.order("published_on desc").limit(4)
    	@churches = Church.order("name asc")
    	@links = Link.order("name asc")
    	@blogs = Blog.order("name asc")
	end

	
end
