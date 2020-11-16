class AddADefaultValueToChargeoptionToBoxbike < ActiveRecord::Migration[6.0]
  def change
    change_column_default :boxbikes, :charge_option, false
  end
end
