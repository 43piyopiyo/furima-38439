class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.integer    :postal_code,      null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city,             null: false
      t.string     :address_detail,   null: false
      t.string     :apartment
      t.integer    :phone_number,     null: false
      t.references :order,            foreign_key:true,null: false
      t.timestamps
    end
  end
end
