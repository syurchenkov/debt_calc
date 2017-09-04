require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { is_expected.to belong_to(:credit) }

  context 'validatate_payments' do 
    let!(:credit) { create(:credit, amount: 10000, rate: 12, arrears_rate: 24, payment_period_in_months: 10) }

    context 'when add regular payment' do 
      let(:payment) { build(:payment, credit: credit) }

      it 'creates payment' do 
        expect{ payment.save }.to change{ credit.payments.count }.by(1)
      end
    end

    context 'when add arrear payment' do 
      let(:payment) { build(:payment, :arrear, credit: credit) }

      it 'creates payment' do 
        expect{ payment.save }.to change{ credit.payments.count }.by(1)
      end
    end

    context 'when add early repayment' do 
      let(:payment) { build(:payment, :early, credit: credit) }

      it 'creates payment' do 
        expect{ payment.save }.to change{ credit.payments.count }.by(1)
      end
    end

    context 'when add early repayment' do 
      let(:payment) { build(:payment, :arrear, :early, credit: credit) }

      it 'creates payment' do 
        expect{ payment.save }.to change{ credit.payments.count }.by(1)
      end
    end
  end


  context 'when attempting to add more than the permitted number of payments to a credit' do 
    let(:number_of_payments) { 4 }
    let!(:credit) do 
      create(:credit_with_payments,
        payment_period_in_months: number_of_payments, 
        payments_count: number_of_payments
      )
    end

    context 'by creating new payment' do 
      let(:payment) { build(:payment, credit_id: credit.id) }

      it 'can not create a payment' do 
        expect { payment.save }.not_to change{ Payment.count }
      end
    end

    context 'by updating existing payment' do 
      let!(:another_credit) { create(:credit) }
      let(:payment) { create(:payment, credit: another_credit) }

      it 'can not update a payment' do 
        expect { payment.update(credit_id: credit.id) }.not_to change{ credit.payments.count }
      end
    end
  end

  context 'when attempting to add the permitted number of payments to a credit' do 
    let(:number_of_payments) { 4 }
    let!(:credit) do 
      create(:credit_with_payments,
        payment_period_in_months: number_of_payments, 
        payments_count: number_of_payments - 1
      )
    end

    context 'by creating new payment' do 
      let(:payment) { build(:payment, credit_id: credit.id) }

      it 'creates a payment' do 
        expect { payment.save }.to change{ Payment.count }.by(1)
      end
    end

    context 'by updating existing payment' do 
      let!(:another_credit) { create(:credit) }
      let(:payment) { create(:payment, credit: another_credit) }

      it 'updates a payment' do 
        expect { payment.update(credit_id: credit.id) }.to change{ credit.payments.count }.by(1)
      end
    end    
  end 
end
