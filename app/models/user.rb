class User < ActiveRecord::Base
  before_create :before_create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :role, :confirm_terms_of_service, :timezone,
                  :city, :state, :zip_code, :birthday, :gender
  attr_accessor :confirm_terms_of_service
  # attr_accessible :city, :state, :zip_code, :birthday, :gender, :role, :confirm_terms_of_service, :timezone

  # relationships
  has_many :questionnaires

  # validations
  validates :city, :state, :zip_code, :birthday, :gender, :role, :timezone, presence: true
  validates :city, :state, length: { in: 1..128 }
  validates_format_of :zip_code, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  validate  :check_gender_type_in_types
  validate  :check_role_type_in_types
  validates :confirm_terms_of_service, :presence => true, :unless => :terms_of_service_confirmed_at?

  # constants
  def self.gender_types
    ['male','female']
  end

  def self.role_types
    ['user','admin']
  end

  # callbacks
  def before_create
    self.terms_of_service_confirmed_at = DateTime.now
  end

  # methods
  def skip_terms_of_service!
    self.terms_of_service_confirmed_at = DateTime.now
  end

  def self.search(search, page, per_page)
    paginate :per_page => per_page, :page => page,
             :conditions => ['email like ?', "%#{search}%"],
             :order => :email
  end

  # private methods
  private

  def check_gender_type_in_types
    errors.add(:gender, "is not a proper type.") unless User.gender_types.include?(gender)
  end

  def check_role_type_in_types
    errors.add(:role, "is not a proper type.") unless User.role_types.include?(role)
  end

end
