config.action_mailer.delivery_method = :sendmail
# Defaults to:
# config.action_mailer.sendmail_settings = {
#   :location => '/usr/sbin/sendmail',
#   :arguments => '-i -t'
# }
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'baci.lindsaar.net',
  :user_name            => '<username>',
  :password             => '<password>',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }