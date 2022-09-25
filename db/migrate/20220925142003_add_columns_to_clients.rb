class AddColumnsToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :email, :string
    add_column :clients, :job, :string
    add_column :clients, :address, :string
    add_column :clients, :zip_code, :string
    add_column :clients, :phone, :string
  end
end
