class Note < ApplicationRecord
  belongs_to :idea, inverse_of: :notes

  validates :idea, presence: true
  validates :content, presence: true
end
