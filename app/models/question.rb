class Question < ActiveRecord::Base
  attr_accessible :title, :answer_type, :group, :unit, :sub_group, :sub_group_unit

  # relationships
  has_many :question_answers
  has_many :answers, :through => :question_answers
  has_many :user_answers

  # validations
  validates :title, :group, :answer_type, presence: true
  validates :title, :group, length: {in: 1..128}
  validates :unit, length: {in: 0..3}
  validate :check_type_in_types

  # constants
  def self.types
    ['choice', 'number']
  end

  def average_value
    if user_answers.empty?
      return 0
    end
    user_answers.average(:value)
  end

  def average_value_by_location(location)
    if location.nil?
      return 0
    end
    value = user_answers.by_location(location).average(:value)
    if value.nil?
      return 0
    end
    value
  end

  def check_type_in_types
    errors.add(:answer_type, "is not a proper type.") unless Question.types.include?(answer_type)
  end

end
