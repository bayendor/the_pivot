class DropItemFillings < ActiveRecord::Migration
  def change
    drop_table :item_fillings
  end
end
