class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :ip
      t.boolean :pending_activation, :default => true
      t.string :phone_number
      t.string :activation_token
      t.timestamps
    end
  end
end
