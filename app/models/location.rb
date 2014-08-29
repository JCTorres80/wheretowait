class Location < ActiveRecord::Base
  # attr
  attr_accessible :address, :name, :phone, :location_type, :website, :city, :state, :zip_code, :open_date

  # relationships
  has_many :questionnaires, :dependent => :destroy
  has_many :user_answers, :through => :questionnaires

  # validations
  validates :phone,:presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  validates :name, :phone, :location_type, :website, :address, :city, :state, :zip_code, presence: true
  validates :name, :address, :city, :state, length: { in: 1..128 }
  validates_format_of :zip_code, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  validates :website, length: { in: 16..128 }
  validate  :check_type_in_types
  validate  :check_url

  # constants
  def self.types
    ['bar','restaurant']
  end

  def self.search(search, page, per_page)
    paginate :per_page => per_page, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => :name
  end

  def phone=(phone)
    if phone.nil?
      write_attribute(:phone, nil)
    else
      write_attribute(:phone, phone.gsub(/\D/, ''))
    end
  end

  def autocomplete_label
    "#{self.address}"
  end

  private

  def check_url
    if !website.nil?
      p = URI(website)
      errors.add(:website, "is not a proper url.") unless !p.scheme.nil? || !p.host.nil? || !p.path.nil?
    end
  end

  def check_type_in_types
    errors.add(:location_type, "is not a proper type.") unless Location.types.include?(location_type)
  end

end
