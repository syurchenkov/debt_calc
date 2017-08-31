class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.references :debtor, foreign_key: true
      t.date :date
      t.monetize :amount
      t.integer :rate
      t.integer :arrears_rate
      t.integer :payment_period_in_months

      t.timestamps
    end
  end
end
