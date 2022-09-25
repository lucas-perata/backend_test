class AddNullFalseClients < ActiveRecord::Migration[7.0]
  def change
    change_column_null :clients, :client_id, false
  end
end
