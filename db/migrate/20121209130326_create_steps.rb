class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :state
      t.integer :user_id
      t.integer :stepstone_id

      t.timestamps
    end
  end
end
