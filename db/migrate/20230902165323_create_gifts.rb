class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.references :inning, foreign_key: true
      t.integer :reason
      t.references :player, foreign_key: true
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.string :name_of_donner
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
