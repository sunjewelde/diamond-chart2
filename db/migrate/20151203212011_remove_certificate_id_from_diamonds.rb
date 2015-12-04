class RemoveCertificateIdFromDiamonds < ActiveRecord::Migration
  def change
    remove_column :diamonds, :certificate_id, :integer
  end
end
