class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image_url
      t.string :slug
      t.references :category, index: true
      t.timestamps
    end
  end
end
