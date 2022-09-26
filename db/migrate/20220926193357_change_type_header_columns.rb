class ChangeTypeHeaderColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :headers, :currency, :string
    change_column :headers, :total, :string
    change_column :headers, :discounts, :string
    change_column :headers, :total_with_discounts, :string
  end
end
