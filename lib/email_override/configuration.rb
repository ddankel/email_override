module EmailOverride
  class Configuration

    attr_accessor :recipient
    attr_accessor :enabled


    # Initialize every configuration with a default.
    # Users of the gem will override these with their
    # desired values
    def initialize
      @recipient = nil
      @enabled = true
    end

  end
end
