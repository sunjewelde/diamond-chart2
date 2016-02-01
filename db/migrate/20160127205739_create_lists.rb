class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.string :color
    	t.float :if, :vvs1, :vvs2, :vs1, :vs2, :si1, :si2
    	t.date :date
    	t.timestamps
    end
  end
end
