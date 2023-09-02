class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :status
      t.string :state
      t.string :city
      t.string :location
      t.string :contact, null: false
      t.references :captain, null: false, foreign_key: {to_table: :players}
      t.references :vice_captain, null: true, foreign_key: {to_table: :players}

      t.timestamps
    end
  end
end
