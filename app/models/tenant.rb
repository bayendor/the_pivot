class Tenant < ActiveRecord::Base
  has_many :users
  has_many :loan_requests, through: :users

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
