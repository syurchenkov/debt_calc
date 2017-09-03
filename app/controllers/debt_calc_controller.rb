class DebtCalcController < ApplicationController
  def main
    @credits = Credit.includes(:debtor).all

    return if params[:credit_id].nil?

    credit_income_command = ComputeCreditIncome.call(params[:credit_id])

    if credit_income_command.success?
      @income_view = IncomeViewObject.new(*credit_income_command.result)
    else
      flash.now[:danger] = credit_income_command.errors[:credit]
    end
  end
end
