class QuestionsController < ApplicationController
  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(params[:question])
  	if @question.save
  		redirect_to questions_path
  	else
  		render "new"
  	end
  end

  def index
  	@questions = Question.order("position ASC")
  	@blog_list = Blog.order("name asc")
    @latest_posts = Post.order("published_on desc").limit(4)
    @side_posts = Post.where('status = ? AND published_on <= ?', "Published", Date.today).order("published_on desc").limit(10)
    @all_categories = Category.order("name ASC")
  end
end
