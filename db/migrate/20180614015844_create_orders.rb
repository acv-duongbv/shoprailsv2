class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :status, default: "waiting"
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
