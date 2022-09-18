module Notificable
  extend ActiveSupport::Concern

  included do
    after_create :send_notifications_to_subscribers
  end

  def send_notifications_to_subscribers
    return unless self.respond_to? :resource
   
    # code smell to not test NotifierJob with test environment 
    return if Rails.env.test? 

    NotifierJob.perform_later(resource, message)
  end
end