class CreateBoxbikes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxbikes do |t|
      t.string :address
      t.integer :capacity
      t.float :price
      t.boolean :charge_option
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
