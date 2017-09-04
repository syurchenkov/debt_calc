require 'rails_helper'

describe ComputeCreditIncome do 
 
  subject(:compute_credit_income) { described_class.call(credit_id) }
  subject(:result) { compute_credit_income.result }

  describe '.call' do 
    context 'when credit with payments exists' do 
      let!(:credit) { create(:credit_with_payments, amount: 100, rate: 12, payment_period_in_months: 4) }
      let!(:credit_id) { credit.id }

      it 'succeeds' do 
        expect(compute_credit_income).to be_success 
      end

      it 'result.main_debt_payments eq 100' do 
        expect(result.first).to eq(Money.new(10000))
      end 

      it 'result.payments_of_interest eq 4' do 
        expect(result.second).to eq(Money.new(400))
      end 
    end

    context 'when credit is not exist' do 
      let!(:credit_id) { 100 }
      
      it 'fails' do 
        expect(compute_credit_income).to be_failure
      end
    end
  end
end