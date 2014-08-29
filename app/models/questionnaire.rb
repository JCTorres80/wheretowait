class Questionnaire < ActiveRecord::Base
  attr_accessible :user, :location, :comment, :flagged, :moderated, :user_answers
  before_save :before_save
  #accepts_nested_attributes_for :user_answers

  # relationships
  belongs_to :user
  belongs_to :location
  has_many :user_answers, :dependent => :destroy

  # valdiations
  validates :comment, :user, :location, presence: true
  validates :comment, length: { in: 1..5000 }

  # scopes
  scope :flagged, where(:flagged => true)
  scope :not_flagged, where(:flagged => false)
  scope :moderated, where(:moderated => true)
  scope :not_moderated, where(:moderated => false)

  # methods
  def prep_user_answers
    if !user_answers.empty?
      return
    end
    Question.all.each do |q|
      user_answers.push UserAnswer.new :question => q, :questionnaire => self, :location => self.location
    end
  end

  def self.search(search, page, per_page)
    paginate :per_page => per_page, :page => page,
             :conditions => ['comment like ?', "%#{search}%"],
             :order => 'created_at DESC'
  end

  def before_save
    if self.moderated
      return
    end

    flagged_words = FlaggedWord.all
    flagged_words.each do |flagged_word|
      unless " #{self.comment} ".match(/\s+#{flagged_word.word}\s+/i).nil?
        self.flagged = true
        return
      end
    end
  end

end
