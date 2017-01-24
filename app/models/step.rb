class Step < ApplicationRecord
  belongs_to :user
  belongs_to :stepstone
  belongs_to :status
end
