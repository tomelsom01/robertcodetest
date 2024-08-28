class AddLockableToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :failed_attempts, :integer, default: 0, null: false 
    add_column :registrations, :unlock_token, :string
    add_column :registrations, :locked_at, :datetime

    add_index :registrations, :unlock_token, unique: true
  end
end
