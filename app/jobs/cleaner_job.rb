require 'sidekiq-scheduler'

class CleanerJob

  def perform
    puts "I am the cleaner worker calling Notification.clean_old"
    Notification.clean_old
  end
end