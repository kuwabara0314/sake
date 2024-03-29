class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :text,                    null: false
      t.integer :shipping_fee,        null: false
      t.integer :prefecture_id,       null: false
      t.integer :price,               null: false
      #t.references :shop,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
