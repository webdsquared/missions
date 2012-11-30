class Link < ActiveRecord::Base
  attr_accessible :link, :name

  validates :name, presence: true, uniqueness: true
  validates :link, presence: true, uniqueness: true
end
