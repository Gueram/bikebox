class AddCoordinatesToBoxbikes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxbikes, :latitude, :float
    add_column :boxbikes, :longitude, :float
  end
end
