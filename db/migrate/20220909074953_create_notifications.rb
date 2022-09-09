class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :player, type: :uuid, foreign_key: { to_table: 'players' }, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end
