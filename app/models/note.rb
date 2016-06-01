class Note < ApplicationRecord
  belongs_to :idea, inverse_of: :notes

  validates_presence_of :idea, :content, :type

  enum type: [:thought, :outcome], _suffix: true

  private
    def self.inheritance_column
      nil
    end
end
