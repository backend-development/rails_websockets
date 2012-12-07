class Step < ActiveRecord::Base
  belongs_to :adventure
  attr_accessible :adventure_id, :description, :title

  validates :title, :length => { :minimum => 5 }

end
