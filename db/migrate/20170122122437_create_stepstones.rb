class CreateStepstones < ActiveRecord::Migration[5.0]
  def change
    create_table :stepstones do |t|
      t.references :adventure, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
