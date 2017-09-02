require 'rails_helper'

describe ComputeCreditIncome do 
 
  subject(:compute_credit_income) { described_class.call(credit_id) }
  subject(:result) { compute_credit_income.result }

  describe '.call' do 
    context 'when credit with payments exists' do 
      let!(:credit) { create(:credit, amount: 100, rate: 12, payment_period_in_months: 4) }
      let!(:credit_id) { credit.id }
      let!(:payments) { Array.new(4) { create(:payment, amount: 26, credit: credit) }}

      it 'succeeds' do 
        expect(compute_credit_income).to be_success 
      end

      it 'result is income_view_object' do 
        expect(result).to be_instance_of(IncomeViewObject)
      end

      it 'result.main_debt_payments eq 100' do 
        expect(result.main_debt_payments).to eq(Money.new(10000))
      end 

      it 'result.payments_of_interest eq 4' do 
        expect(result.payments_of_interest).to eq(Money.new(400))
      end 

      it 'result.real_income eq 12' do 
        expect(result.real_income).to eq(12)
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