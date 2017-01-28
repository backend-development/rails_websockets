class Step < ApplicationRecord
  belongs_to :user
  belongs_to :stepstone

  @@statuses = ['not started', 'blocked', 'working', 'finished']

  validates :status, inclusion: { in: @@statuses }

  def to_s
    user.full_name
  end

  def self.statuses
    @@statuses
  end

end
