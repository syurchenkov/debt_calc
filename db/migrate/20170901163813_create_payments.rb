class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :credit, foreign_key: true
      t.monetize :amount
      t.date :date

      t.timestamps
    end
  end
end
