class Tenant < ActiveRecord::Base
  has_many :users
  has_many :loan_requests, through: :users

  RESERVED_NAMES = %w(users cart loans loan_requests login logout tenants new
                      categories)

  validate :name_cannot_be_a_route
  validates :name, uniqueness: true, presence: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize
  end

  def name_cannot_be_a_route
    if name.present? && RESERVED_NAMES.include?(name.parameterize)
      errors.add(:name, 'has already been taken')
    end
  end
end
