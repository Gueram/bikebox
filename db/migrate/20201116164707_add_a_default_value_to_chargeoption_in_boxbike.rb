class AddADefaultValueToChargeoptionInBoxbike < ActiveRecord::Migration[6.0]
  def change
    change_column_default :contracts, :status, false
  end
end
