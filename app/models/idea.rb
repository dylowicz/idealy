class Idea < ApplicationRecord
  has_many :notes
  validates :title, presence: true
  validates :status, presence: true
  validates :score, presence: true
  enum status: [:new, :active, :dropped, :done], _suffix: true
end
