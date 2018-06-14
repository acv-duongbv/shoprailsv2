class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :name
      t.text :address
      t.string :phone_number
      t.text :notification_params
      t.string :transaction_id
      t.datetime :purchased_at
      t.string :status, default: "waiting"
      t.timestamps
    end
  end
end
