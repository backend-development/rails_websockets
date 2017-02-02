class RenameStatus < ActiveRecord::Migration[5.0]
  def up
    rename_column :steps, :status, :aasm_state
    execute "UPDATE steps SET aasm_state='not_started' WHERE aasm_state='not started' "
  end

  def down
    execute "UPDATE steps SET aasm_state='not started' WHERE aasm_state='not_started' "
    rename_column :steps, :aasm_state, :status
  end
end
