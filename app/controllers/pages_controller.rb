class PagesController < ApplicationController
  def home
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
  end

  def about
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
  end

  def links
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
  end

  def mission
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @churches = Church.order("name asc")
  end

  def support
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
  end
end
