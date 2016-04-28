class Idea < ApplicationRecord
  validates :title, presence: true
  enum status: [:new, :active, :dropped, :done], _suffix: true
end
