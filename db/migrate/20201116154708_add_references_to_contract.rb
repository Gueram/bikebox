class AddReferencesToContract < ActiveRecord::Migration[6.0]
  def change
      add_reference :contracts, :user, foreign_key: true
      add_reference :contracts, :boxbike, foreign_key: true
  end
end
