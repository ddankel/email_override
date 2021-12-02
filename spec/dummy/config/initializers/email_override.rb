# Configure recipient
EmailOverride.configure do |config|
  # Toggle enabled status.  Enabled defaults to true but this value can be used
  # to disable it or set the enabled status programatically
  config.enabled = true

  # Set the recipient.  Can be a fixed value or defined via config/env
  config.recipient = "changed@example.com"
  # config.recipient = Settings.email.recipient_override
  # config.recipient = ENV['EMAIL_RECIPIENT_OVERRIDE']
end


# Apply Interceptor to ActionMailer
ActionMailer::Base.register_interceptor(EmailOverride::RerouteEmailInterceptor)
