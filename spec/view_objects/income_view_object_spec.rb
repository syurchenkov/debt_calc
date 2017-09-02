require 'rails_helper'

RSpec.describe IncomeViewObject do
  context 'create IncomeViewObject with some payments and credit' do 
    let!(:credit_with_payments) { create(:credit_with_payments) }
    let(:main_debt_payments) { Money.new(100) }
    let(:payments_of_interest) { Money.new(0) }
    subject { IncomeViewObject.new(main_debt_payments, payments_of_interest, credit_with_payments) }

    it { expect(subject.main_debt_payments).to eq(main_debt_payments) }
    it { expect(subject.payments_of_interest).to eq(payments_of_interest) }
    it { expect(subject.credit).to eq(credit_with_payments) }
    it { expect(subject.real_income).to eq(0) }
  end
end
