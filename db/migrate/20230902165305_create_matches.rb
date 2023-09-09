class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :team1, null: false, foreign_key: { to_table: :teams }
      t.references :team2, null: false, foreign_key: { to_table: :teams }
      t.integer :number_of_overs, null: false
      t.references :winner_team, null: false, foreign_key: { to_table: :teams }
      t.boolean :is_draw
      t.datetime :start_at
      t.datetime :end_at
      t.references :toss_winer_team, null: false, foreign_key: { to_table: :teams }
      t.integer :won_by_wicket
      t.integer :won_by_runs
      t.text :match_draw_reason
      t.integer :toss_dicision, null: false

      t.timestamps
    end
  end
end
