module Calculations
  class ExtrovertionTableCalculation
    def initialize(score)
      @score = score
    end

    RESULT_TABLE = [
      { min: 0, max: 10, result: "Highly Extroverted" },
      { min: 11, max: 25 , result: "Moderately Extroverted" },
      { min: 26, max: 40, result: "Moderately Introverted" },
      { min: 41, max: 50, result: "Highly Introverted"}
    ]

    def result
      RESULT_TABLE.find { |row| row[:min] <= @score && row[:max] >= @score }[:result]
    end
    
    def max_possible_score
      RESULT_TABLE.last[:max]
    end
  end
end