class CreateManOfTheMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :man_of_the_matches do |t|
      t.references :inning, foreign_key: true
      t.text :reason
      t.references :player, foreign_key: true
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
