class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password, null: false
      t.string :email, null: false, index: { unique: true }
      t.integer :status, null: false
      t.boolean :is_admin
      t.string :token, null: false, index: { unique: true }
      t.integer :user_type

      t.timestamps
    end
  end
end
