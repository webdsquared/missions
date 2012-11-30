class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search])
    if @posts.class == Array
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(4)
    else
      @posts = @posts.page(params[:page]).per(4)
    end
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @side_posts = Post.where('status == ? AND published_on <= ?', "Published", Date.today).order("published_on desc").limit(10)
    @all_categories = Category.order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @side_posts = Post.order("published_on desc").limit(7)
    @all_categories = Category.order("name ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def category
    @posts = Post.search(params[:search])
    if @posts.class == Array
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(4)
    else
      @posts = @posts.page(params[:page]).per(4)
    end
    @blog_list = Blog.order("name ASC")
    @latest_posts = Post.order("created_at DESC").limit(4)
    @all_categories = Category.order("name ASC")
    @side_posts = Post.order("published_on desc").limit(10)
  end
end
