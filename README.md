# Email Override

A simple implementation of an ActionMailer interceptor which will catch all outgoing mail and redirect it to a configurable recipient.

## Installation

Add the gem to your Gemfile

```rb
gem 'email_override', git: 'https://bitbucket.org/pnmg/email_override'
```

...and install it

```sh
bundle install
```

## Usage

Create a template initializer and customize it:

```sh
rails s email_override:initializer
```

or create your own using the following template:

```rb
# Configure recipient
EmailOverride.configure do |config|
  # Toggle enabled status.  Enabled defaults to true but this value can be used
  # to disable it or set the enabled status programatically
  config.enabled = true

  # Set the recipient.  Can be a fixed value or defined via config/env
  # config.recipient = "test@example.com"
  # config.recipient = Settings.email.recipient_override
  # config.recipient = ENV['EMAIL_RECIPIENT_OVERRIDE']
end


# Apply Interceptor to ActionMailer
ActionMailer::Base.register_interceptor(EmailOverride::RerouteEmailInterceptor)
```

## Compatibility

RuboCop officially supports the following Ruby implementations:

- Rails 6.1+
