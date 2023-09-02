class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :email
      t.integer :status
      t.boolean :is_admin
      t.string :token
      t.integer :user_type

      t.timestamps
    end
  end
end
