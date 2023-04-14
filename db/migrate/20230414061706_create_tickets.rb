class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :code, limit: 10

      t.timestamps
    end
    add_index :tickets, :code, unique: true
  end
end
