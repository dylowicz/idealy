class Task < ApplicationRecord
  belongs_to :idea, inverse_of: :tasks

  validates_presence_of :idea, :title
  validates_inclusion_of :completed, in: [true, false]
end
