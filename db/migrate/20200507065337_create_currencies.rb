class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
    add_index :currencies, :name, unique: true
  end
end
