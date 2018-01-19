class ApplicationMailer < ActionMailer::Base
  default from: "\"TWIKR\" <#{Users.email}>"
end
