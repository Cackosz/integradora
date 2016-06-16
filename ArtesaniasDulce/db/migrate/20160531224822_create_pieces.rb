class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :piece_name
      t.integer :piece_quantity
      t.decimal :price
      t.string :matter_name
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
