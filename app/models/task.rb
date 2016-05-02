class Task < ApplicationRecord
  belongs_to :idea, inverse_of: :tasks

  validates :idea, presence: true
  validates :title, presence: true
  validates_inclusion_of :completed, in: [true, false]
end
