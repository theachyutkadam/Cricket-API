class CreateOvers < ActiveRecord::Migration[7.0]
  def change
    create_table :overs do |t|
      t.integer :real_ball_number
      t.integer :run_type
      t.integer :ball_status
      t.integer :wicket_type
      t.references :strick_batsman, foreign_key: true
      t.references :non_strick_batsman, foreign_key: true
      t.references :bowler, foreign_key: true
      t.integer :bowled_in_over
      t.integer :total_runs
      t.integer :over_number
      t.references :inning, foreign_key: true

      t.timestamps
    end
  end
end
