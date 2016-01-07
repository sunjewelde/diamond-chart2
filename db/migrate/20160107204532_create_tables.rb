class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.date :date
      t.float :weight
      t.string :color
      t.string :clar
      t.float :usd_price
      t.float :jpy_price
      t.float :ex_rate

      t.timestamps null: false
    end
  end
end
