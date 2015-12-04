class AddDatetimeToDiamond < ActiveRecord::Migration
  def change
    add_column :diamonds, :datetime, :datetime
  end
end
