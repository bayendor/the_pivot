class DropFillingsTable < ActiveRecord::Migration
  def change
    drop_table :fillings
  end
end
