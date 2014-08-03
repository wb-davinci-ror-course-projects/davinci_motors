# documentation
class Cars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.decimal :price, precision: 8, scale: 2
      # 8 digits long 6 numbers plus two decimals

      t.timestamps

    end
  end
end
