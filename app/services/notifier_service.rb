class NotifierService

  def self.publish(resource, message)
    puts "#######"
    subscribers_ids = PlayerSubscription.player_subscribers_ids(resource.id)
    subscribers_emails = User.where(id: subscribers_ids).pluck(:email)
    
    subscribers_emails.each do |email|
      mail = NotificationMailer.with(recipient: email, message: message, resource: resource)
                               .player_notification_email
      mail.deliver_now!
    end
  end
end