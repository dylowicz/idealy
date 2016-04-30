class Task < ApplicationRecord
  belongs_to :idea
  validates :title, presence: true
  validates_inclusion_of :completed, in: [true, false]
end
