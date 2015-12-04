class AddCertificateIdToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :certificate_id, :string
  end
end
