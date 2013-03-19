class Post < ActiveRecord::Base
  attr_accessible :blog_id, :body, :published_on, :status, :title, :category_ids
  
  belongs_to :blog

  has_many :categorizations
  has_many :categories, through: :categorizations
  accepts_nested_attributes_for :categorizations


  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :body
  validates_presence_of :blog
  validates_presence_of :status

  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.search(search)
  	if search
  		find(:all, conditions: ['title || body LIKE ?', "%#{search}%"], conditions: ['status = ? AND published_on <= ?', "Published", Date.today], order: "published_on DESC")
  	else
  		find(:all, conditions: ['status = ? AND published_on <= ?', "Published", Date.today], order: "published_on DESC")
  	end
  end

end
