class AddConfirmableToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :confirmed_at, :datetime
    add_column :registrations, :confirmation_token, :string
    add_index :registrations, :confirmation_token
    add_column :registrations, :confirmation_sent_at, :datetime
    add_column :registrations, :unconfirmed_email, :string
  end
end
