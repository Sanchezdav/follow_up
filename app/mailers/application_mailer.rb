# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@follow-up.com'
  layout 'mailer'
end
