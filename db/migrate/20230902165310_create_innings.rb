class CreateInnings < ActiveRecord::Migration[7.0]
  def change
    create_table :innings do |t|
      t.references :match, foreign_key: true
      t.integer :inning_type, null: false
      t.references :bat_team, null: false, foreign_key: {to_table: :teams}
      t.integer :total_runs, null: false, default: 0
      t.string :number_of_wickets, null: false, default: 0
      t.datetime :start_at
      t.datetime :end_at
      t.string :target_to_opposition
      t.integer :is_draw
      t.text :draw_reason
      t.references :first_umpire, null: false, foreign_key: {to_table: :players}
      t.references :second_umpire, null: false, foreign_key: {to_table: :players}

      t.timestamps
    end
  end
end
