class Scored

  attr_reader :credit_score

  def initialize(credit_score)
    @credit_score = credit_score
  end

  def calculate_credit_score
    credit_utilization = 50

    # Payment history
    if credit_score >= 350 && credit_score < 580
      credit_score += 30
    elsif credit_score >= 580 && credit_score < 670
      credit_score += 60
    elsif credit_score >= 670 && credit_score < 780
      credit_score += 90
    elsif credit_score >= 780 && credit_score < 850
      credit_score += 120
    elsif credit_score >= 850
      credit_score += 150
    end

    # Credit utilization
    if credit_utilization < 30
      credit_score += 30
    elsif credit_utilization >= 30 && credit_utilization < 50
      credit_score += 20
    elsif credit_utilization >= 50 && credit_utilization < 70
      credit_score += 10
    elsif credit_utilization >= 70
      credit_score -= 10
    end

    # Credit history length
    if credit_history_length < 2
      credit_score -= 10
    elsif credit_history_length >= 2 && credit_history_length < 5
      credit_score += 10
    elsif credit_history_length >= 5 && credit_history_length < 7
      credit_score += 20
    elsif credit_history_length >= 7
      credit_score += 30
    end

    # Credit mix
    if credit_mix == "Good"
      credit_score += 10
    elsif credit_mix == "Fair"
      credit_score += 5
    elsif credit_mix == "Poor"
      credit_score -= 5
    end

    # New credit
    if new_credit == "Yes"
      credit_score -= 5
    end

    return credit_score
  end

end

# Example usage:

credit_score = 680

calculator = Scored.new(credit_score)
credit_score = calculator.calculate_credit_score

puts credit_score
