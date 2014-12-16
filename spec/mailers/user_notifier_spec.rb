require "rails_helper"

RSpec.describe UserNotifier, :type => :mailer do
  let(:user) { FactoryGirl.build_stubbed(:user, token: '1234567890') }

  describe "signed_up" do
    let(:mail) { UserNotifier.signed_up(user) }

    it "renders the headers" do
      expect(mail.subject).to eq('Please verify your e-mail address')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['m.patrick.hidalgo@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello #{user.first_name.titleize}")
      expect(mail.body.encoded).to match(verify_email_url(user.token))
    end
  end

  describe "verified" do
    let(:mail) { UserNotifier.verified(user) }

    it "renders the headers" do
      expect(mail.subject).to eq('Thank you for verifying your e-mail address')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['m.patrick.hidalgo@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello #{user.first_name.titleize}")
    end
  end

  describe "verify" do
    let(:mail) { UserNotifier.verify(user) }

    it "renders the headers" do
      expect(mail.subject).to eq('Please verify your e-mail address')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['m.patrick.hidalgo@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello #{user.first_name.titleize}")
      expect(mail.body.encoded).to match(verify_email_url(user.token))
    end
  end


end
