class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid do |t|
      t.string :name
      t.integer :number
      t.string :nationality
      t.date :birthdate
      t.string :position

      t.timestamps
    end
  end
end
