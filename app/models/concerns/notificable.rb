module Notificable
  extend ActiveSupport::Concern

  included do
    after_create :send_notifications_to_subscribers
  end

  def send_notifications_to_subscribers
    return unless self.respond_to? :resource
    
    NotifierJob.perform_later(resource, message)
  end
end