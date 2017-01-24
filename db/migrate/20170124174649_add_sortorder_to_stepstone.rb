class AddSortorderToStepstone < ActiveRecord::Migration[5.0]
  def change
    add_column :stepstones, :sortorder, :integer
  end
end
