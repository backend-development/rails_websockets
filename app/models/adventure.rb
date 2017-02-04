class Adventure < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id', inverse_of: :owned_adventures
  has_many :stepstones, dependent: :destroy, before_add: :set_sort_order
  has_many :steps, through: :stepstones
  has_many :users, -> { distinct }, through: :steps

  validates :title, length: { minimum: 3 }

  def to_s
    title
  end

  def full_stepstones
    stepstones.includes(:steps).includes(:users).order(:sortorder)
  end

  # set sortorder of all stepstones, zero-based!
  def order_stepstones!(stepstone_order)
    new_sortorder = 0
    stepstone_order.each do |stepstone_id|
      s = stepstones.find(stepstone_id)
      s.update!(sortorder: new_sortorder)
      new_sortorder += 1
    end
  end

  def statuses_of(user)
    return nil if user.nil? or user.id.nil?
    sql = <<~SQL
      SELECT sortorder, aasm_state AS status
      FROM stepstones
      LEFT JOIN steps
      ON (stepstones.id = steps.stepstone_id)
      WHERE stepstones.adventure_id=#{id}
      AND steps.user_id=#{user.id}
      ORDER BY sortorder
    SQL
    records_array = ActiveRecord::Base.connection.execute(sql)
    # [{"sortorder"=>1, "status"=>"not started"},
    #  {"sortorder"=>2, "status"=>"not started"},
    #  {"sortorder"=>6, "status"=>"finished"}... ]

    statuses = []

    next_index = 0
    records_array.each do |h|
      statuses[next_index] = h['status']
      next_index += 1
    end

    # builds array with step-no as index:
    #             0              1              2
    # statuses = ["not started", "not started", "finished"]

    statuses
  end

  private

  def set_sort_order(new_stepstone)
    if stepstones.empty?
      new_stepstone.sortorder = 0
    else
      new_stepstone.sortorder = 1 + stepstones.pluck(:sortorder).max
    end
  end
end
