class Idea < ApplicationRecord
  belongs_to :user, inverse_of: :ideas
  has_many :notes, inverse_of: :idea, dependent: :destroy
  has_many :tasks, inverse_of: :idea, dependent: :destroy

  validates_presence_of :user, :title, :status, :score

  enum status: [:new, :active, :dropped, :done], _suffix: true

  def current_status_css
    case status
      when 'new' then 'info'
      when 'active' then 'warning'
      when 'dropped' then 'default'
      when 'done' then 'success'
    end
  end
end
