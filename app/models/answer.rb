class Answer < ActiveRecord::Base
  attr_accessible :title, :value

  # relationships
  has_many :user_answers
  has_many :question_answers
  has_many :questions, :through => :question_answers

  # validations
  validates :title, :value, presence: true
  validates :title, length: {in: 1..128}
  validates :value, :numericality => true

end
