class Tenant < ActiveRecord::Base
  has_many :users
  has_many :loan_requests, through: :users

  RESERVED_NAMES = %w(users build_item cart order loans loan_requests
                      register login logout tenants new)
  
  validate :name_cannot_be_a_route
  validates :name, uniqueness: true, presence: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def name_cannot_be_a_route
    if name.present? && RESERVED_NAMES.include?(name.parameterize)
      errors.add(:name, 'has already been taken')
    end
  end
end
