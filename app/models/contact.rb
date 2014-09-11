class Contact < ActiveRecord::Base
  attr_accessible :comment, :email, :name

  validates :name, :email, :comment, presence: true
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Only proper email addresses allowed'}
  validates :name, :length => {:in => 2..128}
  validates :comment, :length => {:in => 2..5000}, :allow_nil => true

end
