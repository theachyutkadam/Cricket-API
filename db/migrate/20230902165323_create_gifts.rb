class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.references :inning, null: false, foreign_key: true
      t.integer :reason
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :name_of_donner
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
