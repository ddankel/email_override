require "rails/generators"

module EmailOverride

  module Generators

    # Generator to create email_override initializer
    #
    class InitializerGenerator < Rails::Generators::Base

      def create_initializer_file
        EmailOverride::Generators::InitializerGenerator.source_root File.expand_path(
          "templates", __dir__
        )
        template = File.join(File.expand_path("templates", __dir__), "email_override.rb")
        copy_file template, Rails.root.join("config", "initializers", "email_override.rb")
      end

    end

  end

end
