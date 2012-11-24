class Contact < ActiveRecord::Base
  attr_accessible :church, :email, :first_name, :last_name, :message, :phone

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :message

end
