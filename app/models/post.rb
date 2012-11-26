class Post < ActiveRecord::Base
  attr_accessible :blog_id, :body, :published_on, :status, :title, :category_ids

  belongs_to :blog

  has_many :categorizations
  has_many :categories, through: :categorizations

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :body
  validates_presence_of :blog_id

  def self.search(search)
  	if search
  		find(:all, conditions: ['title || body LIKE ?', "%#{search}%"], order: "created_at DESC")
  	else
  		find(:all)
  	end
  end

end
