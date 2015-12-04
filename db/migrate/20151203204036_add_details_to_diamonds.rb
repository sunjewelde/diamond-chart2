class AddDetailsToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :cut_grade, :string
    add_column :diamonds, :rapnet_list_price, :integer
    add_column :diamonds, :rapnet_discount, :integer
    add_column :diamonds, :price_per_carat, :integer
    add_column :diamonds, :polish, :string
    add_column :diamonds, :symmetry, :string
    add_column :diamonds, :fluorescen, :string
    add_column :diamonds, :certificate_id, :integer
  end
end
