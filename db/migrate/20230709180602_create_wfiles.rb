class CreateWfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :wfiles do |t|
      t.string :name
      t.boolean :is_dir
      t.string :owner
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
