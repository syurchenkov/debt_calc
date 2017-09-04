class AddIsEarlyRepaymentToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :is_early_repayment, :boolean, default: false
  end
end
