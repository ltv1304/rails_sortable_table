class CreateWfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :wfiles do |t|
      t.string :item_name
      t.string :item_path
      t.integer :item_type
      t.integer :parent
      t.string :owner

      t.timestamps
    end
  end
end
