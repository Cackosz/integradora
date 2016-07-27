class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name_enterprise
      t.string :name_pro
      t.string :first_name
      t.string :last_name
      t.string :matter
      t.text :location

      t.timestamps null: false
    end
  end
end
