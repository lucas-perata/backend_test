class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :client, null: false, foreign_key: true
      t.string :transaction_id, null: false
      t.integer :amount
      t.string :reserved
      t.integer :type

      t.timestamps
    end
  end
end
