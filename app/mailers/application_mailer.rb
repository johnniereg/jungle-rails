class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  ActionMailer::Base.delivery_method = :test


end
