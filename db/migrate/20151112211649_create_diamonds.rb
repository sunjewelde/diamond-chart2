class CreateDiamonds < ActiveRecord::Migration
  def change
    create_table :diamonds do |t|
      t.date :date
      t.float :weight
      t.string :color
      t.string :clar
      t.float :start_price
      t.float :end_price
      t.float :low_price
      t.float :high_price

      t.timestamps null: false
    end
  end
end
