class Adventure < ApplicationRecord
  belongs_to :user
  has_many :stepstones, dependent: :destroy

  validates :title, length: { minimum: 3 }
end
