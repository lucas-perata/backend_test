# frozen_string_literal: true

class ChangeColumnNameTransactions < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :type, :status
  end
end
