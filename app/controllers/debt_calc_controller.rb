class DebtCalcController < ApplicationController
  def main
    @credits = Credit.includes(:debtor).all

    credit_income_command = ComputeCreditIncome.call(params[:credit_id])
    
    if credit_income_command.success?
      @income_view = credit_income_command.result
    else 
      flash.now[:danger] = credit_income_command.errors[:credit]
      @income_view = nil
    end
  end
end
