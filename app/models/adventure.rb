class Adventure < ActiveRecord::Base
  has_many :steps
  attr_accessible :description, :title

  scope :current
end
