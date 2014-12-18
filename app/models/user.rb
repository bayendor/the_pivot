class User < ActiveRecord::Base
  belongs_to :tenant
  has_secure_password
  has_many :loans
  has_many :loan_requests
  has_many :user_roles
  has_many :roles, through: :user_roles
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, length: {minimum: 2, maximum: 32,
    too_short: "must have at least %{count} letters",
    too_long: "must have at most %{count} letters"
  }
  validates :password, confirmation: true
  before_validation :assign_username
  before_validation :check_last_name

  def is_admin?
    self.roles.any? { |role| role.name == "admin"}
  end

  def is_a_tenant?
    self.tenant_id != nil
  end

  def is_webmaster?
    self.roles.any? { |role| role.name == "webmaster"}
  end

  private

  def assign_username
    self.username ||= self.first_name
  end

  def check_last_name
    self.last_name ||= ""
  end
end
