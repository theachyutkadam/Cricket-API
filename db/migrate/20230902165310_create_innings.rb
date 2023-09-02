class CreateInnings < ActiveRecord::Migration[7.0]
  def change
    create_table :innings do |t|
      t.references :match, foreign_key: true
      t.integer :inning_type
      t.references :bat_team, foreign_key: true
      t.integer :total_runs
      t.string :number_of_wickets
      t.datetime :start_at
      t.datetime :end_at
      t.string :target_to_opposition
      t.integer :is_draw
      t.text :draw_reason
      t.references :first_umpire, foreign_key: true
      t.references :second_umpire, foreign_key: true

      t.timestamps
    end
  end
end
