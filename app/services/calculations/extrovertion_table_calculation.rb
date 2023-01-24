module Calculations
  class ExtrovertionTableCalculation
    def initialize(score)
      @score = score
    end

    RESULT_TABLE = [
      { min: 0, max: 10, result: "Highly Introverted" },
      { min: 11, max: 25 , result: "Moderately Introverted" },
      { min: 26, max: 40, result: "Moderately Extroverted" },
      { min: 41, max: 50, result: "Highly Extroverted"}
    ]

    def result
      RESULT_TABLE.find { |row| row[:min] <= @score && row[:max] >= @score }[:result]
    end

    def percent_result
      score.to_f / max_possible_score.to_f
    end
    
    def self.max_possible_score
      RESULT_TABLE.last[:max]
    end
  end
end