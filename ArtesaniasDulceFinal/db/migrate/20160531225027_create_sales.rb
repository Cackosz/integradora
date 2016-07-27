class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :piece, index: true, foreign_key: true
      t.integer :sale_quantity
      t.decimal :total

      t.timestamps null: false
    end
  end
end
