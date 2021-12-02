require "rails/generators"

module EmailOverride
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      def create_initializer_file
        EmailOverride::Generators::InitializerGenerator.source_root File.expand_path('../templates', __FILE__)
        template = File.join(File.expand_path('../templates', __FILE__), 'email_override.rb')
        copy_file template, "#{Rails.root}/config/initializers/email_override.rb"
      end
    end
  end
end

