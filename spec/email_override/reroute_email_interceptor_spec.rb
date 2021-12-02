require "rails_helper"
require_relative "../../lib/email_override/reroute_email_interceptor"

RSpec.describe EmailOverride::RerouteEmailInterceptor, type: :mailer do
  let(:from)    { "from@example.com" }
  let(:to)      { "to@example.com" }
  let(:cc)      { "cc@example.com" }
  let(:bcc)     { "bcc@example.com" }
  let(:changed) { "changed@example.com" }
  let(:subject) { "Test Subject" }

  let(:mail) do
    ActionMailer::Base.mail(to:      to,
                            cc:      cc,
                            bcc:     bcc,
                            from:    from,
                            subject: subject,
                            body:    "test").deliver
  end

  context "When EmailOverride is disabled" do
    before do
      EmailOverride.configuration.enabled = false
    end

    it "doesn't change the recipients" do
      aggregate_failures do
        expect(mail.to).to eq([to])
        expect(mail.cc).to eq([cc])
        expect(mail.bcc).to eq([bcc])
      end
    end

    it "doesn't change the subject" do
      expect(mail.subject).to eq(subject)
    end
  end

  context "when EmailOverride is enabled" do
    before do
      EmailOverride.configuration.enabled = true
      EmailOverride.configuration.recipient = changed
    end

    it "changes the 'to' recipient" do
      expect(mail.to).to eq([changed])
    end

    it "clears the 'cc' and 'bcc' recipients" do
      expect(mail.cc).to eq([])
      expect(mail.bcc).to eq([])
    end

    it "updates the subject" do
      aggregate_failures do
        expect(mail.subject).to start_with("#{subject} [Original: ")
        expect(mail.subject).to include("to: #{to}")
        expect(mail.subject).to include("cc: #{cc}")
        expect(mail.subject).to include("bcc: #{bcc}")
      end
    end
  end
end
