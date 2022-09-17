class CreatePlayerSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :player_subscriptions, id: :uuid do |t|
      t.references :user, type: :uuid, null: false
      t.references :player, type: :uuid, null: false

      t.timestamps
    end
    add_index :player_subscriptions, [:user_id, :player_id], unique: true
  end
end
