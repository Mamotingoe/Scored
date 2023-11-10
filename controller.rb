class CreditScoreCalculatorController < ApplicationController
  def calculate
    @credit_score = Scored.new(680).calculate_credit_score
  end
end
