class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :full_name
      t.integer :email
      t.integer :age

      t.timestamps
    end
  end
end