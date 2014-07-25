class Cars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :price

      t.timestamps

    end
  end
end
