class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_bikes
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
