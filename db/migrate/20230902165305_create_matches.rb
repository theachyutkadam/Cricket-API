class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :team1, foreign_key: true
      t.references :team2, foreign_key: true
      t.integer :number_of_overs
      t.references :winner_team, foreign_key: true
      t.boolean :is_draw
      t.datetime :start_at
      t.datetime :end_at
      t.references :toss_winer_team_id, foreign_key: true
      t.integer :won_by_wicket
      t.integer :won_by_runs
      t.text :match_draw_reason
      t.integer :toss_dicision

      t.timestamps
    end
  end
end
