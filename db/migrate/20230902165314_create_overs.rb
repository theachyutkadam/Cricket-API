class CreateOvers < ActiveRecord::Migration[7.0]
  def change
    create_table :overs do |t|
      t.integer :real_ball_number, null: false
      t.integer :run_type, null: true
      t.integer :ball_status, null: false
      t.integer :wicket_type, null: true
      t.references :strick_batsman, null: false, foreign_key: {to_table: :players}
      t.references :non_strick_batsman, null: false, foreign_key: {to_table: :players}
      t.references :bowler, null: false, foreign_key: {to_table: :players}
      t.integer :bowled_in_over
      t.integer :total_runs, null: false
      t.integer :over_number, null: false
      t.references :inning, foreign_key: true

      t.timestamps
    end
  end
end
