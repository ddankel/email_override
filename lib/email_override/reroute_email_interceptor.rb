module EmailOverride

  # Intercept any outgoing mail and direct it to a specified acount
  #
  # This Interceptor will only make changes to the mail object if the
  # Settings.email.recipient_override setting is present.
  #
  class RerouteEmailInterceptor

    OriginalHeader = Struct.new(:to, :cc, :bcc, keyword_init: true)

    # Intercept the mail upon delivery and make the specified changes
    #
    # @param  mail  [Object]  Mail object being intercepted
    #
    def self.delivering_email(mail)
      return unless EmailOverride.configuration.enabled
      return if recipient_override.blank?

      initial_header = extract_initial_header(mail)
      mail = rebuild_header(mail)
      mail.subject = "#{mail.subject} [Original: #{stringify_header(initial_header)}]"
      Rails.logger.info "Rerouted '#{initial_header.to}' to '#{recipient_override}'."
    end


    # Fetch the email address to use as the override from Settings
    #
    # @return [String, nil]
    #
    def self.recipient_override
      EmailOverride.configuration.recipient
    end


    # Extract the initial recipients from the mail object
    #
    # @param  mail  [Object]  Mail object being intercepted
    # @return [OriginalHeader]
    #
    def self.extract_initial_header(mail)
      OriginalHeader.new(to:  mail.header[:to].to_s,
                         cc:  mail.header[:cc].to_s,
                         bcc: mail.header[:bcc].to_s)
    end


    # Rebuild the mail object header to only send ot the override address
    #
    # @param  mail  [Object]  Mail object being intercepted
    # @return [Object]
    #
    def self.rebuild_header(mail)
      mail.to = recipient_override
      mail.cc = [] if mail.cc.present?
      mail.bcc = [] if mail.bcc.present?
      mail
    end


    # Compile all recipient changes to a string for display/reporting purposes
    #
    # @param  headers   [OriginalHeader]  Original email recipient headers
    # @return [String]
    #
    def self.stringify_header(headers)
      originals = []
      originals << "to: #{headers.to}"
      originals << "cc: #{headers.cc}" if headers.cc.present?
      originals << "bcc: #{headers.bcc}" if headers.bcc.present?
      originals.join(", ")
    end




  end

end
