class StepstoneAddPosition < ActiveRecord::Migration
  def up
    add_column :stepstones, :position, :integer, :default => 1
    add_index :stepstones, [:adventure_id, :position]
  end

  def down
    remove_column :stepstones, :position
    remove_index :stepstones, [:adventure_id, :position]
  end
end
