class CreateHeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :headers do |t|
      t.references :client, null: false, foreign_key: true
      t.string :payment_id
      t.string :reserved
      t.integer :currency
      t.integer :total
      t.integer :discounts
      t.integer :total_with_discounts

      t.timestamps
    end
  end
end
