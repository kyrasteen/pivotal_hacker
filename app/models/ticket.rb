class Ticket < ActiveRecord::Base
  belongs_to :board

  enum status: %w(backlog current-sprint in-progress done)

  scope :backlogged, -> { where(status: 0)}
  scope :sprinting, -> { where(status: 1)}
  scope :progressing, -> { where(status: 2)}
  scope :done, -> { where(status: 3)}
end
