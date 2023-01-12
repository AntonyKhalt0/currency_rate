class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.string :from_name
      t.string :to_name
      t.integer :from_code
      t.integer :to_code
      t.decimal :buy, precision: 10, scale: 5
      t.decimal :sell, precision: 10, scale: 5

      t.timestamps
    end
  end
end
