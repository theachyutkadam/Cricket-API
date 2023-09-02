class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :status
      t.string :state
      t.string :city
      t.string :location
      t.string :contact
      t.references :captain, foreign_key: true
      t.references :vice_captain, foreign_key: true

      t.timestamps
    end
  end
end
