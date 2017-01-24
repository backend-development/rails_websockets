class Stepstone < ApplicationRecord
  belongs_to :adventure

  validates :description, length: { minimum: 8 }

  default_scope { order('sortorder') }
end
