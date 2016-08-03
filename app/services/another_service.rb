class AnotherService
    def initialize
    @results =      []
  end

  def self.perform ops={}
    #Rails.logger.debug("hey you!")
    #Rails.logger.debug(ops)
    strategies = ops[:strategies]

    Rails.logger.debug("strategies: " + strategies.to_s)
  end
end
