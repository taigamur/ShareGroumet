class AddAddressToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :address, :text
  end
end
