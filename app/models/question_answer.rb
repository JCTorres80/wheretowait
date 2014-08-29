class QuestionAnswer < ActiveRecord::Base
  attr_accessible :answer, :question

  # relationships
  belongs_to :question
  belongs_to :answer

  # validations
  validates :question, :answer, presence: true
end
