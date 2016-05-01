class Note < ApplicationRecord
  belongs_to :idea

  validates :content, presence: true
end
