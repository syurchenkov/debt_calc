class DebtCalcController < ApplicationController
  def main
  end

  private 
    def debt_calc_params
      params.permit(:credit_id)
    end
end
