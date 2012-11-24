class Church < ActiveRecord::Base
  attr_accessible :city, :link, :name, :state

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :link

end
