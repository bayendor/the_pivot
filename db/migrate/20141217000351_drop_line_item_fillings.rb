class DropLineItemFillings < ActiveRecord::Migration
  def change
    drop_table :line_item_fillings
  end
end
