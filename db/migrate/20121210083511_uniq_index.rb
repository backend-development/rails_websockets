class UniqIndex < ActiveRecord::Migration
  def up
    Step.destroy_all
    add_index :steps, [:stepstone_id, :user_id], :uniq => true
  end

  def down
    remove_index :steps, [:stepstone_id, :user_id]
  end
end
