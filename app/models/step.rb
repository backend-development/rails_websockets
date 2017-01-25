class Step < ApplicationRecord
  belongs_to :user
  belongs_to :stepstone
  belongs_to :status

  def to_s
    user.full_name
  end
end
