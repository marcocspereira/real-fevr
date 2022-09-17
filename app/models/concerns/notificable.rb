module Notificable
  extend ActiveSupport::Concern

  included do
    after_commit :send_notifications_to_subscribers
  end

  def send_notifications_to_subscribers
    return unless self.respond_to? :resource_id
    
    NotifierJob.perform_later(resource_id)
  end
end