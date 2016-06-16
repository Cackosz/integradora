class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name_matter
      t.decimal :price
      t.integer :quantity
      t.decimal :total_inversion
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
