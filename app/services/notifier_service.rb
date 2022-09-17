class NotifierService

  def self.publish(resource_id)
    byebug
    puts "#######"
    subscribers_ids = PlayerSubscription.subscribers_ids(resource_id)
    puts subscribers_ids
    subscribers_emails = User.where(id: subscribers_ids).pluck(:email)
    puts subscribers_emails
    # enviar email
    puts "NotifierService: #{resource_id}"
    puts subscribers_emails
  end
end