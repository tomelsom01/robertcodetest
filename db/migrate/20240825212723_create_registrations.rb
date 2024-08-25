class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :is_verified
      t.string :verification_token
      t.string :reset_token
      t.string :roles

      t.timestamps
    end
  end
end
