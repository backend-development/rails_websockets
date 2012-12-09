class Adventure < ActiveRecord::Base
  belongs_to :user
  has_many :stepstones, :order => "position"
  attr_accessible :title, :description, :user_id

  validates_presence_of :title, :user_id
  validates :title, :length => { :minimum => 5 }

  scope :current
end
