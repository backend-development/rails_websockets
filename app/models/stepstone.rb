class Stepstone < ApplicationRecord
  belongs_to :adventure
  has_many :steps, dependent: :destroy
  has_many :users, through: :steps

  validates :description, length: { minimum: 8 }
end
