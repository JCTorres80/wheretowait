class FlaggedWord < ActiveRecord::Base
  attr_accessible :word

  # validations
  validates :word, presence: true
  validates :word, length: {in: 1..128}

  def self.search(search, page, per_page)
    paginate :per_page => per_page, :page => page,
             :conditions => ['word like ?', "%#{search}%"],
             :order => :word
  end

end
