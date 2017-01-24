class Status < ApplicationRecord
  default_scope { order('sortorder') }
  has_many :steps
end
