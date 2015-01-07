class User < ActiveRecord::Base
  belongs_to :tenant
  has_many :loans
  has_many :loan_requests
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_secure_password

  validates :first_name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 2, maximum: 32,
                                 too_short: 'must have at least %{count} letters',
                                 too_long: 'must have at most %{count} letters' },
                        presence: true
  validates :password, length: { minimum: 6 }, allow_blank: true

  def admin?
    roles.any? { |role| role.name == 'admin' }
  end

  def tenant?
    tenant_id != nil
  end
end
