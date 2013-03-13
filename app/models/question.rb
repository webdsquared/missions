class Question < ActiveRecord::Base
  attr_accessible :answer, :position, :question

  validates_presence_of :question
  validates_presence_of :answer
  validates_presence_of :position

end
