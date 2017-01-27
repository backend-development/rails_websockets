class Adventure < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", inverse_of: :owned_adventures
  has_many :stepstones, dependent: :destroy
  has_many :steps, through: :stepstones
  has_many :users, -> { distinct }, through: :steps

  validates :title, length: { minimum: 3 }

  def to_s
    title
  end
end
