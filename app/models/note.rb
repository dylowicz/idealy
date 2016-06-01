class Note < ApplicationRecord
  belongs_to :idea, inverse_of: :notes

  validates_presence_of :idea, :content
end
