class NotifierService

  def self.publish(resource, message)
    puts "#######"
    subscribers_ids = PlayerSubscription.player_subscribers_ids(resource.id)
    subscribers_emails = User.where(id: subscribers_ids).pluck(:email)
    puts subscribers_emails
    # enviar email
    puts "NotifierService: #{resource.id}"
    
    puts subscribers_emails
    
    subscribers_emails.each do |email|
      puts "vou chamar o mailer para #{email} com a messagem #{message}. O jogador #{resource.name}"
      mail = NotificationMailer.with(recipient: email, message: message, resource: resource)
                               .player_notification_email
      mail.deliver_now!
    end
  end
end