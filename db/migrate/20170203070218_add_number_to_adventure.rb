class AddNumberToAdventure < ActiveRecord::Migration[5.0]
  def change
    add_column :adventures, :prefix, :string
  end
end
