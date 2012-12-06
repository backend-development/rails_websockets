class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :adventure_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
