class Adventure < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 3 }
end
