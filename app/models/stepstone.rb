class Stepstone < ApplicationRecord
  belongs_to :adventure
  has_many :steps, dependent: :destroy
  has_many :users, through: :steps

  validates :description, length: { minimum: 8 }

  def step_of(user)
    return nil if user.nil?
    potential_step = steps.group_by(&:user_id)[user.id]
    return nil if potential_step.nil?
    return potential_step.first
  end
end
