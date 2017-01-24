class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.references :user, foreign_key: true
      t.references :stepstone, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
