class Note < ApplicationRecord
  belongs_to :idea, inverse_of: :notes

  validates :idea, presence: true
  validates :content, presence: true
  validates :type, presence: true

  enum type: [:thought, :outcome], _suffix: true

  private
    def self.inheritance_column
      nil
    end
end
