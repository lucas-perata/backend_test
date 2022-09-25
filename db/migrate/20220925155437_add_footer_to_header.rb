class AddFooterToHeader < ActiveRecord::Migration[7.0]
  def change
    add_reference :headers, :footer, foreign_key: true
  end
end
