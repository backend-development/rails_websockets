class RenameSteps < ActiveRecord::Migration
  def self.up
    rename_table :steps, :stepstones
  end

  def self.down
    rename_table :stepstones, :steps
  end
end
