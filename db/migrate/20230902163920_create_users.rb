class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password, null: false
      t.string :email, null: false, index: { unique: true }
      t.integer :status, null: false
      t.string :token, null: true, index: { unique: true }
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
