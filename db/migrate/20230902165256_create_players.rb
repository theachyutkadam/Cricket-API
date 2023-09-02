class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :contact, null: false, index: { unique: true }
      t.integer :gender, null: false
      t.date :birth_date, null: true
      t.integer :speciality, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
