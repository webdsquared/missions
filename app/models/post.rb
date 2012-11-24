class Post < ActiveRecord::Base
  attr_accessible :blog_id, :body, :published_on, :status, :title

  belongs_to :blog_id

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :body


end
