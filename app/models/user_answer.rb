class UserAnswer < ActiveRecord::Base
  attr_accessible :questionnaire, :question, :value, :location

  # relationships
  belongs_to :question
  belongs_to :questionnaire
  belongs_to :location

  # validations
  validates :question, :questionnaire, :location, presence: true
  validates :value, :numericality => true

  def self.search(page, per_page)
    paginate :per_page => per_page, :page => page,
             :order => 'created_at DESC'
  end

  # scopes
  scope :by_location, lambda { |location_id| where('location_id = ?', location_id) }
  scope :by_question, lambda { |question_id| where('question_id = ?', question_id) }

end
