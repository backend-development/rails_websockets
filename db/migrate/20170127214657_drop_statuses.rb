class DropStatuses < ActiveRecord::Migration[5.0]
  def up
    remove_column :steps, :status_id
    drop_table :statuses
  end
  def down
    create_table :statuses do |t|
      t.string :status
      t.integer :sortorder
    end
  end
end
