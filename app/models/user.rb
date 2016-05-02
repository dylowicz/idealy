class User < ApplicationRecord
  before_save { self.email.downcase! }

  has_secure_password
  has_many :ideas, inverse_of: :user, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 3..50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /@/
  validates :password, presence: true, length: { minimum: 6 }
end
