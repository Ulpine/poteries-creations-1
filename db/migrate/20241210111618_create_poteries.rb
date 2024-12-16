class CreatePoteries < ActiveRecord::Migration[7.1]
  def change
    create_table :poteries do |t|
      t.string :artiste
      t.text :description
      t.string :technique
      t.string :categorie
      t.string :photo

      t.timestamps
    end
  end
end
