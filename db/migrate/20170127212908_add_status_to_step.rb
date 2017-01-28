class AddStatusToStep < ActiveRecord::Migration[5.0]
  def up
    add_column :steps, :status, :string
    execute "UPDATE steps SET status=statuses.status FROM statuses WHERE steps.status_id=statuses.id"
  end
  def down
    remove_column :steps, :status
  end  
end
