class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact
      t.integer :gender
      t.date :birth_date
      t.integer :speciality
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
