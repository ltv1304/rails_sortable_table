class CreateWfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :wfiles do |t|
      t.string :name
      t.boolean :is_dir
      t.string :owner
      t.references :parent, foreign_key: { to_table: :wfiles }

      t.timestamps
    end
  end
end
