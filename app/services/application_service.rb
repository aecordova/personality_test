class ApplicationService
  def self.execute(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError
  end

  class Outcome
    attr_accessor :data
    attr_reader :errors
  
    def initialize
      @data = nil
      @errors = []
    end

    def success?
      errors.empty?
    end

    def failure?
      !success?
    end

    def add_error(step, message)
      @errors << { step: step, message: message }
    end

    def add_errors(errors)
      @errors += errors
    end
  end
end
