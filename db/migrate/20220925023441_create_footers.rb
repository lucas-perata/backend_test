class CreateFooters < ActiveRecord::Migration[7.0]
  def change
    create_table :footers do |t|
      t.references :client, null: false, foreign_key: true
      t.string :reserved
      t.date :payment_date

      t.timestamps
    end
  end
end
