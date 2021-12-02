require "email_override/version"
require "email_override/railtie"
require "email_override/configuration"
require "email_override/reroute_email_interceptor"

module EmailOverride

  class << self

    # Instantiate the Configuration singleton or return it. The instance has
    # attribute readers so that we can access the configured values
    def configuration
      @configuration ||= Configuration.new
    end


    # This is the configure block definition. The configuration method will
    # return the Configuration singleton, which is then yielded to the
    # configure block. Then it's just a matter of using the attribute
    # accessors we previously defined
    def configure
      yield(configuration)
    end

  end

end
