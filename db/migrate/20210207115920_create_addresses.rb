class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :zip_number,       null: false
      t.integer    :dispatch_area_id, null: false
      t.string     :city,             null: false
      t.string     :block_number,     null: false
      t.string     :building_name
      t.string     :phone_number,     null: false
      t.references :order,            foreign_key: true
      t.timestamps
    end
  end
end
