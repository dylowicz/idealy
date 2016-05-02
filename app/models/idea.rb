class Idea < ApplicationRecord
  belongs_to :user, inverse_of: :ideas
  has_many :notes, inverse_of: :idea, dependent: :destroy
  has_many :tasks, inverse_of: :idea, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true
  validates :status, presence: true
  validates :score, presence: true

  enum status: [:new, :active, :dropped, :done], _suffix: true
end
